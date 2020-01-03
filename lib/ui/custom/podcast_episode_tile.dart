import 'package:flutter/material.dart';
import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/ui/custom/custom_image.dart';
import 'package:tutu/ui/utils/app_colors.dart';

class PodcastEpisodeTile extends StatelessWidget {

  final PodcastEpisode episode;

  PodcastEpisodeTile(this.episode);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBackground,
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          child: CustomImage(
            url: episode.thumbnailUrl,
          ),
        ),
        title: Text(episode.title),
      ),
    );
  }
}