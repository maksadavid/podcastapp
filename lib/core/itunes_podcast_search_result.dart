import 'package:tutu/core/podcast.dart';

class ITunesPodcastSearchResult {

  final List<Podcast> podcasts;

  ITunesPodcastSearchResult(this.podcasts);

  factory ITunesPodcastSearchResult.fromJson(Map<String, dynamic> json) {
    List results = json['results'];
    List<Podcast> podcasts = results.map((json) {
      return Podcast.fromJson(json);
    }).toList();
    return ITunesPodcastSearchResult(podcasts);
  }
}