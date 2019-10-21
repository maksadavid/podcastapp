import 'package:tutu/core/podcast.dart';

class ITunesPodcastSearchResult {

  final List<Podcast> podcasts;

  ITunesPodcastSearchResult(this.podcasts);

  factory ITunesPodcastSearchResult.fromJson(Map<String, dynamic> json) {
    List results = json['results'];
    List<Podcast> podcasts = results.map((json) {
      return Podcast(json['trackName']);
    }).toList();
    return ITunesPodcastSearchResult(podcasts);
  }
}