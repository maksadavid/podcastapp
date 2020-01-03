

import 'package:tutu/service/database/database_service.dart';

extension Extra on PodcastEpisode {
  PodcastEpisode merge(Podcast podcast) {
    return copyWith(thumbnailUrl: (thumbnailUrl != null || thumbnailUrl.isEmpty) ? podcast.imageUrl : thumbnailUrl);
  }
}