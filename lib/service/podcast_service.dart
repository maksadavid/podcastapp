


import 'package:http/http.dart' as http;

import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

import 'database/database_service.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';

class PodcastService {

  Future<PodcastServiceResponse> fetchPodcast(String url) async {
    bool isValidUrl = url != null && Uri.parse(url).isAbsolute;
    if (!isValidUrl) {
      return Future.error("Invalid podcast url");
    }
    final response = await http.get(url);
    if (response.statusCode != 200) {
      return Future.error("Failed to connect to the server");
    }
    final parsedResponse = await parseRssFeed(response.body, url);
    return parsedResponse;
  }

  Future<PodcastServiceResponse> parseRssFeed(String xmlString, String rssUrl) async {
    RssFeed rss;
    try {
      rss = RssFeed.parse(xmlString);
    } on Exception catch (_) {
      return Future.error("Failed to parse data");
    }
    String title = rss.title != null ? rss.title : "";
    String imageUrl = (rss.image != null && rss.image.url != null) ? rss.image.url : "";
    String author = rss.author != null ? rss.author : "";
    Podcast podcast = Podcast(id: 0, title: title, imageUrl: imageUrl, thumbnailUrl: imageUrl, rssUrl: rssUrl, author: author, description: rss.description);
    List<PodcastEpisode> episodes = rss.items.map(createFromRssItem).toList();
    return PodcastServiceResponse(podcast, episodes);
  }

  PodcastEpisode createFromRssItem(RssItem item) {
    return PodcastEpisode(
        id:0,
        podcastId:0,
        title: item.title,
        description: item.description,
        link: item.enclosure.url,
        pubDate: 0, //item.pubDate,
        comments: item.comments,
        thumbnailUrl: "");
  }
}

class PodcastServiceResponse {
  Podcast podcast;
  final List<PodcastEpisode> episodes;
  PodcastServiceResponse(this.podcast, this.episodes);

  void merge(Podcast p) {
    podcast = podcast.merge(p);
    List<PodcastEpisode> list = episodes.map((e) => e.merge(p)).toList();
    episodes.clear();
    episodes.addAll(list);
  }
}
