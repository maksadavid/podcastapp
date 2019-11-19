


import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';
import 'package:tutu/service/database/tables/podcast_episode_table.dart';
import 'package:tutu/service/database/tables/podcast_table.dart';

class PodcastStorage {

  Database _database;

  PodcastStorage(this._database);

  StreamController<List<Podcast>> _podcastsStreamController = StreamController.broadcast();

  Stream<List<Podcast>> get podcastsStream => _podcastsStreamController.stream;

  Future<void> save(Podcast podcast) async {
    int podcastId = await _database.insert(
      PodcastTable.TABLE_NAME,
      PodcastTable.mapFrom(podcast),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await _database.transaction((txn) async {
      Batch batch = txn.batch();
      for (PodcastEpisode episode in podcast.episodes) {
        episode.podcastId = podcastId;
        batch.insert(PodcastEpisodeTable.TABLE_NAME,
          PodcastEpisodeTable.mapFrom(episode),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit();
    });

    List<Podcast> podcasts = await _fetchAllPodcast();
    _podcastsStreamController.add(podcasts);
  }

  Future<List<Podcast>> _fetchAllPodcast() async {
    List<Map<String, dynamic>> maps = await _database.query(PodcastTable.TABLE_NAME);
    List<Podcast> podcasts = List<Podcast>();
    for (Map<String, dynamic> map in maps) {
      podcasts.add(PodcastTable.podcastFrom(map));
    }
    return podcasts;
  }
}

