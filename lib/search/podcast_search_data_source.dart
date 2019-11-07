

import 'package:tutu/core/itunes_podcast_search_result.dart';

import 'package:tutu/service/service_holder.dart';


class PodcastSearchDataSource {

  String query;
  Future<ITunesPodcastSearchResult> searchResult;

  Future<ITunesPodcastSearchResult> fetchPodcasts(String query) {
    if (this.query == query) {
      return searchResult;
    }
    this.query = query;
    searchResult = ServiceHolder.iTunesPodcastService.fetchPodcasts(query);
    return searchResult;
  }

}