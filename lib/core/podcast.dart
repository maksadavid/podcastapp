



import 'package:tutu/core/podcast_episode.dart';

class Podcast {

  int id;
  String title;
  String imageUrl;
  String thumbnailUrl;
  String rssUrl;
  String author;
  List<PodcastEpisode> episodes;
  String description;

  Podcast(this.id, this.title, this.imageUrl, this.thumbnailUrl, this.rssUrl,
      this.author, this.episodes, this.description);

}