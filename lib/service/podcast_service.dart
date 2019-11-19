


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
    String title = rss.title != null ? rss.title : "";
    String imageUrl = (rss.image != null && rss.image.url != null) ? rss.image.url : "";
    String link = rss.link != null ? rss.link : "";
    String author = rss.author != null ? rss.author : "";
    Podcast podcast = Podcast(0, title, imageUrl, imageUrl, link, author, List<PodcastEpisode>(), "");
    podcast.description = rss.description;
    podcast.episodes = rss.items.map(createFromRssItem).toList();
    return podcast;
  }

  PodcastEpisode createFromRssItem(RssItem item) {
    return PodcastEpisode(0, 0, item.title, item.description, item.link, item.pubDate, item.comments);
  }

}

