import 'package:flutter/material.dart';
import 'package:tutu/feature/podcast/podcast_data_source.dart';
import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/service/service_holder.dart';
import 'package:tutu/ui/utils/app_colors.dart';

import 'custom/custom_image.dart';
import 'custom/expandable_text.dart';
import 'custom/podcast_episode_tile.dart';

class PodcastDetailPage extends StatefulWidget {
  PodcastDetailPage({Key key, this.podcast}) : super(key: key);

  final Podcast podcast;

  @override
  PodcastDetailPageState createState() => PodcastDetailPageState(podcast);
}

class PodcastDetailPageState extends State<PodcastDetailPage> {
  PodcastDataSource dataSource;

  PodcastDetailPageState(Podcast podcast) {
    dataSource = PodcastDataSource(podcast);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.lightBackground,
        body: SingleChildScrollView(
            child: Column(
          children: [
            StreamBuilder<Podcast>(
                stream: dataSource.getPodcastStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (!snapshot.hasData) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Text("Error: " + snapshot.error.toString())
                      )
                    );
                  }
                  Podcast podcast = snapshot.data;
                  return null;
                }),
            StreamBuilder<List<PodcastEpisode>>(
                stream: dataSource.getPodcastEpisodeStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData || snapshot.data.isEmpty) {
                    return Container();
                  }
                  List<Widget> widgets = <Widget>[];
                  int i = 0;
                  for (PodcastEpisode episode in snapshot.data) {
                    widgets.add(Container(height: 1, color: AppColors.white));
                    widgets.add(
                      Container(
                        height: 80,
                        child: PodcastEpisodeTile(episode),
                      ),
                    );
                    if (++i == 4) break;
                  }
                  widgets.add(Container(height: 1, color: AppColors.white));
                  return Column(
                    children: widgets,
                  );
                })
          ],
        )));
  }
}

class PodcastHeader extends StatelessWidget {
  final Podcast _podcast;
  PodcastHeader(this._podcast);

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
                  child: CustomImage(
                    url: _podcast.imageUrl,
                  )
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                        child: Text(
                          _podcast.title,
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                      FlatButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          onPressed: () {
                            ServiceHolder.databaseService
                                .savePodcast(_podcast);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Saved"),
                            ));
                          },
                          child: Text(
                            "Subscribe!",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.accent),
                          ))
                    ],
                  )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ExpandableText(_podcast.description),
            color: AppColors.lightBackground,
          ),
        ],
      );
  }
}