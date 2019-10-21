

import 'package:tutu/core/itunes_podcast_search_result.dart';

import 'package:tutu/service/service_holder.dart';


class PodcastSearchDataSource {

  Future<ITunesPodcastSearchResult> fetchPodcasts(String query) {
    return ServiceHolder.iTunesPodcastService.fetchPodcasts(query);
  }

}