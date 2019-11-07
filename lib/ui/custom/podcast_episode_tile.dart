import 'package:flutter/material.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';
import 'package:tutu/ui/custom/custom_image.dart';
import 'package:tutu/ui/utils/app_colors.dart';

class PodcastEpisodeTile extends StatelessWidget {

  final Podcast podcast;
  final int episodeIndex;

  PodcastEpisodeTile(this.podcast, this.episodeIndex);

  @override
  Widget build(BuildContext context) {
    if(podcast.episodes.length <= episodeIndex) {
      return Container();
    }
    PodcastEpisode episode = podcast.episodes[episodeIndex];
    return Container(
      color: AppColors.lightBackground,
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: ListTile(
        leading: Container(
          width: 60,
          child: CustomImage(
            url: podcast.thumbnailUrl,
          ),
        ),
        title: Text(episode.title),
        subtitle: Text(episode.pubDate),
      ),
    );
  }
}