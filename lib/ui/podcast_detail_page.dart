import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutu/feature/podcast/podcast_bloc.dart';
import 'package:tutu/feature/podcast/podcast_episodes_bloc.dart';
import 'package:tutu/feature/podcast/podcast_repository.dart';
import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/ui/utils/app_colors.dart';

import 'custom/expandable_text.dart';
import 'custom/podcast_episode_tile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PodcastDetailPage extends StatefulWidget {
  final Podcast _podcast;
  final PodcastRepository _repository = PodcastRepository();

  PodcastDetailPage(this._podcast) {
    Future.delayed(Duration(milliseconds: 300), () {
      _repository.loadPodcast(_podcast, 4);
    });
  }

  @override
  State<StatefulWidget> createState() => PodcastDetailPageState();
}

class PodcastDetailPageState extends State<PodcastDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PodcastBloc>(
            create: (BuildContext context) =>
                PodcastBloc(widget._repository, widget._podcast)),
        BlocProvider<PodcastEpisodeListBloc>(
            create: (BuildContext context) => PodcastEpisodeListBloc(
                widget._repository, null)),
      ],
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.lightBackground,
        body: ListView(
          children: [
            PodcastHeader(),
            PodcastEpisodeList(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget._repository.dispose();
    super.dispose();
  }
}

class PodcastHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 160,
              color: AppColors.lightBackground,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Hero(
                tag:  context.bloc<PodcastBloc>().state.podcast.thumbnailUrl,
                child: CachedNetworkImage(
                  imageUrl: context.bloc<PodcastBloc>().state.podcast.thumbnailUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: Text(
                        context.bloc<PodcastBloc>().state.podcast.title,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
                BlocBuilder<PodcastBloc, PodcastBlocState>(
                    builder: (context, state) {
                  return FlatButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      onPressed: () {
                        context.bloc<PodcastBloc>().subscribeToPodcast();
                      },
                      child: Text(
                        state.isSubscribed
                            ? "Unsubscribe"
                            : "Subscribe!",
                        style: TextStyle(fontSize: 18, color: AppColors.accent),
                      ));
                }),
              ],
            ))
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          color: AppColors.lightBackground,
          child: BlocBuilder<PodcastBloc, PodcastBlocState>(
              builder: (context, state) {
            return ExpandableText(context.bloc<PodcastBloc>().state.podcast.description);
          }),
        ),
      ],
    );
  }
}

class PodcastEpisodeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodcastEpisodeListBloc, List<PodcastEpisode>>(
      builder: (context, episodes) {
        if (episodes == null) {
          return Container();
        }
        return Column(
          children: [
            for (PodcastEpisode episode in episodes)
              Container(
                height: 80,
                child: PodcastEpisodeTile(episode),
              ),
          ],
        );
      },
    );
  }
}
