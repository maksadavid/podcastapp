


import 'package:http/http.dart' as http;

import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

import 'database/database_service.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';

class PodcastService {

  Future<PodcastServiceResponse> fetchPodcast(String url) async {
    final response = await http.get(url);
    final parsedResponse = await parseRssFeed(response.body);
    return parsedResponse;
  }

  Future<PodcastServiceResponse> parseRssFeed(String xmlString) async {
    RssFeed rss;
    try {
      rss = RssFeed.parse(xmlString);
    } on Exception catch (_) {
      return Future.error("Failed to parse data");
    }
    String title = rss.title != null ? rss.title : "";
    String imageUrl = (rss.image != null && rss.image.url != null) ? rss.image.url : "";
    String link = rss.link != null ? rss.link : "";
    String author = rss.author != null ? rss.author : "";
    Podcast podcast = Podcast(id: 0, title: title, imageUrl: imageUrl, thumbnailUrl: imageUrl, rssUrl: link, author: author, description: rss.description);
    List<PodcastEpisode> episodes = rss.items.map(createFromRssItem).toList();
    return PodcastServiceResponse(podcast, episodes);
  }

  PodcastEpisode createFromRssItem(RssItem item) {
    return PodcastEpisode(
        id:0,
        podcastId:0,
        title: item.title,
        description: item.description,
        link: item.link,
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
