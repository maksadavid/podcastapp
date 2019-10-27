import 'package:flutter/material.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/podcast/podcast_data_source.dart';

import 'custom/CustomImage.dart';
import 'custom/ExpandableText.dart';

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
              Podcast podcast = snapshot.data;
              return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: CustomImage(url: podcast.imageUrl,)
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: ExpandableText(podcast.description),
                        color: Colors.grey[200],
                      )
                    ],
                  )
              );
            }
        )
    );
  }
}