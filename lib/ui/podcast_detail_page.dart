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
        appBar: AppBar(
          title: Text(widget.podcast.title),
        ),
        backgroundColor: AppColors.lightBackground,
        body: StreamBuilder<Podcast>(
            stream: dataSource.getPodcastStream(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator()
                );
              } else if (!snapshot.hasData) {
                return AlertDialog(
                    title: Text("Error"),
                  content: Text(snapshot.error.toString()),
                );
              }
              Podcast podcast = snapshot.data;

              return ListView(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.lightBackground,
                          padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                          child: CustomImage(url: podcast.imageUrl,)
                      ),
                      Container(height: 1, color: AppColors.white),
                      Container(
                        child: Row(
                          children: <Widget>[
                            FlatButton(
                                onPressed: () {
                                    ServiceHolder.databaseService.savePodcast(podcast);
                                    Scaffold.of(context).showSnackBar( SnackBar(content: Text("Saved"),));
                                },
                                child: Text("Subscribe!",
                                  style: TextStyle(fontSize: 30),
                                )
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Text(
                            podcast.title,
                          style: TextStyle(
                            fontSize: 22
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: ExpandableText(podcast.description),
                        color: AppColors.lightBackground,
                      ),
                      EpisodesList(dataSource),
                    ],
              );
            }
        )
    );
  }
}

class EpisodesList extends StatelessWidget {

  final PodcastDataSource dataSource;

  EpisodesList(this.dataSource);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PodcastEpisode>> (
      stream: dataSource.getPodcastEpisodeStream(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator()
          );
        }
        if(!snapshot.hasData || snapshot.data.isEmpty) {
          return Container();
        }
        List<Widget> widgets = <Widget>[];
        int i = 0;
        for(PodcastEpisode episode in snapshot.data) {
          widgets.add(Container(height: 1, color: AppColors.white));
          widgets.add(Container(
              height: 80,
              child: PodcastEpisodeTile(episode),
          ),);
          if( ++i == 4) break;
        }
        widgets.add(Container(height: 1, color: AppColors.white));
        return Column(children: widgets,);
      });
  }
}