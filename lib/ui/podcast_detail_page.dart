import 'package:flutter/material.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/podcast/podcast_data_source.dart';
import 'package:tutu/ui/utils/app_colors.dart';

import 'custom/custom_image.dart';
import 'custom/expandable_text.dart';
import 'custom/podcast_episode_tile.dart';

class PodcastDetailPage extends StatefulWidget {
  PodcastDetailPage({Key key, this.podcast}) : super(key: key);

  final Podcast podcast;

  @override
  PodcastDetailPageState createState() => PodcastDetailPageState(podcast.rssUrl);
}

class PodcastDetailPageState extends State<PodcastDetailPage> {

  PodcastDataSource dataSource = PodcastDataSource();
  Future<Podcast> podcastFuture;

  PodcastDetailPageState(String rssUrl) {
    podcastFuture = dataSource.fetchPodcast(rssUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.podcast.title),
        ),
        backgroundColor: AppColors.lightBackground,
        body: FutureBuilder<Podcast>(
            future: podcastFuture,
            builder: (context, snapshot) {
              if(snapshot.connectionState != ConnectionState.done) {
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
                      Container(height: 1, color: AppColors.white),
                      PodcastEpisodeTile(podcast, 0),
                      Container(height: 1, color: AppColors.white),
                      PodcastEpisodeTile(podcast, 1),
                      Container(height: 1, color: AppColors.white),
                      PodcastEpisodeTile(podcast, 2),
                      Container(height: 1, color: AppColors.white),
                      PodcastEpisodeTile(podcast, 3),
                      Container(height: 1, color: AppColors.white),
                      Container(height: 100)
                    ],
              );
            }
        )
    );
  }
}