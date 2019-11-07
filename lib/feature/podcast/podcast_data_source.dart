

import 'package:tutu/core/podcast.dart';

import 'package:tutu/service/service_holder.dart';

class PodcastDataSource {

  Future<Podcast> fetchPodcast(String url) {
    return ServiceHolder.podcastService.fetchPodcast(url);
  }
}