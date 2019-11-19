import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/ui/podcast_detail_page.dart';
import 'package:tutu/ui/search_page.dart';

import 'utils/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<List<Podcast>> fetchPodcasts;

  HomePageState() {
   // fetchPodcasts = ServiceHolder.databaseService.podcastStorage.fetchAll();
  }

  void addPodcast() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage(title: "Search")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                    Icons.add,
                    color: AppColors.white
                ),
                onPressed: addPodcast
            ),
          ],
        ),
        body: FutureBuilder(
          future: fetchPodcasts,
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return Center(
                child: Text("Error " + snapshot.error.toString()),
              );
            } else if(!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<Podcast> podcasts = snapshot.data;
            return ListView.builder(
              itemCount: podcasts.length,
              itemBuilder: (context, index) {
                Podcast podcast = podcasts[index];
                return ListTile(
                  title: Text(podcast.title),
                  leading: CachedNetworkImage(
                      width: 60,
                      imageUrl: podcast.thumbnailUrl),
                  subtitle: Text(podcast.author),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PodcastDetailPage(podcast: podcast,)
                    ));
                  },
                );
              },
            );
          },
        )
    );
  }
}