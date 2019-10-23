



class Podcast {

  String title;
  String imageUrl;
  String thumbnailUrl;
  String rssUrl;
  String author;

  Podcast(this.title, this.imageUrl, this.thumbnailUrl, this.rssUrl,
      this.author);

  factory Podcast.fromJson(Map<String, dynamic> json) {
    return Podcast(json['trackName'],
        json['artworkUrl100'],
        json['artworkUrl60'],
        json['feedUrl'],
        json['artistName']
    );
  }
}