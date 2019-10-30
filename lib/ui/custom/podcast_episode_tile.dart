import 'package:flutter/material.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';
import 'package:tutu/ui/custom/custom_image.dart';
import 'package:tutu/ui/utils/app_colors.dart';

class PodcastEpisodeTile extends StatelessWidget {

  final Podcast podcast;
  final PodcastEpisode episode;

  PodcastEpisodeTile(this.podcast, this.episode);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBackground,
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: ListTile(
        leading: CustomImage(
          url: podcast.thumbnailUrl,
        ),
        title: Text(episode.title),
        subtitle: Text(episode.pubDate),
      ),
    );
  }
}