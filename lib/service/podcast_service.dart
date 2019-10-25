


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:tutu/core/podcast.dart';
import 'package:webfeed/domain/rss_feed.dart';


class PodcastService {

  Future<Podcast> fetchPodcast(String url) async {
    final response = await http.get(url);
    final rss = await compute(parseRssFeed, response.body);
    return Podcast(rss.title, rss.image.url, rss.image.url, url, rss.author);
  }

  static RssFeed parseRssFeed(String xmlString) {
    return RssFeed.parse(xmlString);
  }

}

