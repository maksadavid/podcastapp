



import 'package:tutu/core/podcast_episode.dart';

class Podcast {

  String title;
  String imageUrl;
  String thumbnailUrl;
  String rssUrl;
  String author;
  List<PodcastEpisode> episodes;

  Podcast(this.title, this.imageUrl, this.thumbnailUrl, this.rssUrl,
      this.author);

}