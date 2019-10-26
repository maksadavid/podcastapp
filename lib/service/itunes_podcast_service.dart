


import 'package:http/http.dart' as http;
import 'package:tutu/core/itunes_podcast_search_result.dart';
import 'dart:convert';

import 'package:tutu/core/podcast.dart';


class ITunesPodcastService {

  Future<ITunesPodcastSearchResult> fetchPodcasts(String query) async {
    if (query.isEmpty) {
      return ITunesPodcastSearchResult(List<Podcast>());
    }
    final response = await http.get('https://itunes.apple.com/search?entity=podcast&term=' + query);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return parseITunesPodcastSearchResultFromJson(json.decode(response.body));
    }
    throw Exception('Failed to load');
  }

  static ITunesPodcastSearchResult parseITunesPodcastSearchResultFromJson(Map<String, dynamic> json) {
    List results = json['results'];
    List<Podcast> podcasts = results.map((json) {
      return parsePodcastFromJson(json);
    }).toList();
    return ITunesPodcastSearchResult(podcasts);
  }

  static Podcast parsePodcastFromJson(Map<String, dynamic> json) {
    return Podcast(json['trackName'],
        json['artworkUrl100'],
        json['artworkUrl60'],
        json['feedUrl'],
        json['artistName']
    );
  }

}

