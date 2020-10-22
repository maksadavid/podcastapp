

import 'dart:async';
import 'dart:math';

import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/service/podcast_service.dart';

import 'package:tutu/service/service_holder.dart';

class PodcastRepository {

  StreamController<Podcast> _podcastStreamController = StreamController();
  StreamController<List<PodcastEpisode>> _podcastEpisodesStreamController = StreamController();

  Stream<Podcast> getPodcastStream() => _podcastStreamController.stream;
  Stream<List<PodcastEpisode>> getPodcastEpisodeStream() => _podcastEpisodesStreamController.stream;

  void loadPodcast(Podcast podcast, int episodeCount) async {
    Podcast p = await ServiceHolder.databaseService.getPodcast(podcast.id);
    if (p != null) {
      List<PodcastEpisode> episodes = await ServiceHolder.databaseService.getPodcastEpisodes(podcast.id, episodeCount);
      _podcastStreamController.add(p);
      _podcastEpisodesStreamController.add(episodes);
    } else {
      PodcastServiceResponse response = await ServiceHolder.podcastService.fetchPodcast(podcast.rssUrl);
      response.merge(podcast);
      _podcastStreamController.add(response.podcast);
      int count = min(response.episodes.length, episodeCount);
      _podcastEpisodesStreamController.add(response.episodes.sublist(0, count));
    }
    _podcastStreamController.addStream(ServiceHolder.databaseService.watchPodcast(podcast.id));
    _podcastEpisodesStreamController.addStream(ServiceHolder.databaseService.watchPodcastEpisodes(podcast.id, episodeCount));
  }

  void dispose() {
    _podcastStreamController.close();
    _podcastEpisodesStreamController.close();
  }
}