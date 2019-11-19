

import 'dart:async';

import 'package:tutu/core/podcast.dart';

import 'package:tutu/service/service_holder.dart';

class PodcastDataSource {

  Podcast podcast;
  StreamController<Podcast> _streamController = StreamController();

  PodcastDataSource(this.podcast) {
    if (podcast.id == 0) {
      ServiceHolder.podcastService.fetchPodcast(podcast.rssUrl).then((p) {
        _streamController.add(p);
      });
    } else {



      _streamController.addStream(
          ServiceHolder.databaseService.podcastStorage.podcastsStream.map((List<Podcast> podcasts) {
            return podcasts[0];
          })
      );
    }
  }

  Stream<Podcast> getPodcastStream() {
    return _streamController.stream;
  }
}