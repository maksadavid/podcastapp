


import 'package:http/http.dart' as http;
import 'package:tutu/core/itunes_podcast_search_result.dart';
import 'dart:convert';


class ITunesPodcastService {

  Future<ITunesPodcastSearchResult> fetchPodcasts(String query) async {
    final response = await http.get('https://itunes.apple.com/search?entity=podcast&term=' + query);
    await Future.delayed(Duration(seconds: 4));
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ITunesPodcastSearchResult.fromJson(json.decode(response.body));
    }
    throw Exception('Failed to load');
  }
}

