import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/service/service_holder.dart';
import 'package:tutu/ui/podcast_detail_page.dart';
import 'package:tutu/ui/search_page.dart';
import 'package:tutu/ui/utils/app_animations.dart';

import 'utils/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<List<Podcast>> fetchPodcasts;

  HomePageState() {
   // fetchPodcasts = ServiceHolder.databaseService.podcastStorage.fetchAll();
  }

  void _addPodcast() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage(title: "Search")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                    Icons.add,
                    color: AppColors.white
                ),
                onPressed: _addPodcast
            ),
          ],
        ),
        body: StreamBuilder(
          stream: ServiceHolder.databaseService.watchPodcasts(),
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return Center(
                child: Text("Error " + snapshot.error.toString()),
              );
            } else if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if(!snapshot.hasData) {
              return Center(
                child: Text("No data"),
              );
            }

            List<Podcast> podcasts = snapshot.data;
            return ListView.builder(
              itemCount: podcasts.length,
              itemBuilder: (context, index) {
                Podcast podcast = podcasts[index];
                return ListTile(
                  title: Text(podcast.title),
                  leading: Hero(
                    tag: podcast.thumbnailUrl,
                    child: CachedNetworkImage (
                        width: 60,
                        imageUrl: podcast.thumbnailUrl),
                  ),
                  subtitle: Text(podcast.author),
                  onTap: () {
                    AppAnimations.openPage(context, PodcastDetailPage(podcast));
                  },
                );
              },
            );
          },
        )
    );
  }
}