


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';


class PodcastService {

  Future<Podcast> fetchPodcast(String url) async {
    final response = await http.get(url);
    final podcast = await parseRssFeed(response.body);
    return podcast;
  }

  Future<Podcast> parseRssFeed(String xmlString) async {
    RssFeed rss = RssFeed.parse(xmlString);
    String imageUrl = rss.image != null ? rss.image.url : null;
    Podcast podcast = Podcast(rss.title, imageUrl, imageUrl, rss.link, rss.author);
//    podcast.episodes = rss.items.map(createFromRssItem);
    return podcast;
  }

  PodcastEpisode createFromRssItem(RssItem item) {
    return PodcastEpisode(item.title, item.description, item.link, item.pubDate, item.comments);
  }

}

