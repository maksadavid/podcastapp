

import 'dart:async';

import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';

import 'package:tutu/service/service_holder.dart';

class PodcastDataSource {

  Podcast podcast;
  StreamController<Podcast> _podcastStreamController = StreamController();
  StreamController<List<PodcastEpisode>> _podcastEpisodesStreamController = StreamController();

  PodcastDataSource(this.podcast) {
//    if (podcast.id == 0) {
      ServiceHolder.podcastService.fetchPodcast(podcast.rssUrl).then((response) {
        Podcast p = response.podcast.merge(podcast);
        List<PodcastEpisode> episodes = response.episodes.map((e) => e.merge(podcast)).toList();
        _podcastStreamController.add(p);
        _podcastEpisodesStreamController.add(episodes);
      }).catchError((error) {
        _podcastStreamController.addError(error);
        _podcastEpisodesStreamController.add(List<PodcastEpisode>());
      });
//    } else {
////      _streamController.addStream(
////          ServiceHolder.databaseService.podcastStorage.podcastsStream.map((List<Podcast> podcasts) {
////            return podcasts[0];
////          })
////      );
//    }
  }

  Stream<Podcast> getPodcastStream() => _podcastStreamController.stream;
  Stream<List<PodcastEpisode>> getPodcastEpisodeStream() => _podcastEpisodesStreamController.stream;

}