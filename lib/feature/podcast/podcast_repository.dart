

import 'dart:async';
import 'dart:math';

import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/service/podcast_service.dart';

import 'package:tutu/service/service_holder.dart';

class PodcastRepository {

  StreamController<PodcastBlockEvent> _podcastStreamController = StreamController();
  StreamController<List<PodcastEpisode>> _podcastEpisodesStreamController = StreamController();

  Stream<PodcastBlockEvent> getPodcastStream() => _podcastStreamController.stream;
  Stream<List<PodcastEpisode>> getPodcastEpisodeStream() => _podcastEpisodesStreamController.stream;

  void loadPodcast(Podcast podcast, int episodeCount) async {
    PodcastServiceResponse response;
    try {
      response = await ServiceHolder.podcastService.fetchPodcast(podcast.rssUrl);
      response.merge(podcast);
    } on Exception catch (_) {}

    Podcast p = await ServiceHolder.databaseService.getPodcast(podcast.id);

    if (response == null) {
      _podcastStreamController.add(PodcastUpdateEvent(podcast, p != null));
      return;
    }

    _podcastStreamController.add(PodcastUpdateEvent(response.podcast, p != null));
    int count = min(response.episodes.length, episodeCount);
    _podcastEpisodesStreamController.add(response.episodes.sublist(0, count));
    ServiceHolder.databaseService.watchPodcast(podcast.id).map((e) => PodcastUpdateEvent(e, true)).listen((event) {
      _podcastStreamController.add(event);
    });
    ServiceHolder.databaseService.watchPodcastEpisodes(podcast.id, episodeCount).listen((event) {
      _podcastEpisodesStreamController.add(event);
    });
  }

  void dispose() {
    _podcastStreamController.close();
    _podcastEpisodesStreamController.close();
  }
}

class PodcastBlockEvent {}

class PodcastUpdateEvent extends PodcastBlockEvent {
  Podcast podcast;
  bool isSubscribed;
  PodcastUpdateEvent(this.podcast, this.isSubscribed);
}