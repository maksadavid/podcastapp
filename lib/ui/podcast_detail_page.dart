import 'package:flutter/material.dart';
import 'package:tutu/core/itunes_podcast_search_result.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/podcast/podcast_data_source.dart';
import 'package:tutu/search/podcast_search_data_source.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'custom/CustomImage.dart';

class PodcastDetailPage extends StatefulWidget {
  PodcastDetailPage({Key key, this.podcast}) : super(key: key);

  final Podcast podcast;

  @override
  PodcastDetailPageState createState() => PodcastDetailPageState();
}

class PodcastDetailPageState extends State<PodcastDetailPage> {

  PodcastDataSource dataSource = PodcastDataSource();

  @override
  Widget build(BuildContext context) {

    Future<Podcast> podcastFuture = dataSource.fetchPodcast(widget.podcast.rssUrl);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.podcast.title),
        ),
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
              return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          padding: new EdgeInsets.all(40.0),
                          child: CustomImage(
                            url: snapshot.data.imageUrl,
                          )
                      )
                    ],
                  )
              );
            }
        )
    );
  }
}