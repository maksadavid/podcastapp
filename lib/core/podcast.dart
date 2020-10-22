

import 'package:tutu/service/database/database_service.dart';

extension Extra on Podcast {
  Podcast merge(Podcast podcast) {

    return copyWith(
        id: podcast.id,
        imageUrl: (imageUrl != null || imageUrl.isEmpty) ? podcast.imageUrl : imageUrl
    );
  }
}