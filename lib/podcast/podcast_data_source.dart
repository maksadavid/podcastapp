

import 'package:tutu/core/itunes_podcast_search_result.dart';
import 'package:tutu/core/podcast.dart';

import 'package:tutu/service/service_holder.dart';


class PodcastDataSource {

  Future<Podcast> fetchPodcast(String url) {
    return ServiceHolder.podcastService.fetchPodcast(url);
  }

}