import 'package:flutter/material.dart';
import 'package:tutu/core/itunes_podcast_search_result.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/search/podcast_search_data_source.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                    Icons.search,
                    color: Colors.white
                ),
                onPressed: () {
                    showSearch(context: context, delegate: PodcastSearchDelegate());
                }
            ),
          ],
        ),
        body: null
    );
  }
}

class PodcastSearchDelegate extends SearchDelegate<String> {

  final dataSource = PodcastSearchDataSource();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () { query = "";},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future<ITunesPodcastSearchResult> result = dataSource.fetchPodcasts(query);
    return Center(
      child: FutureBuilder<ITunesPodcastSearchResult>(
        future: result,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            List<Podcast> podcasts = snapshot.data.podcasts;
            return ListView.builder(
                itemCount: podcasts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(podcasts[index].title),
                    onTap: () {

                    },
                  );
                }
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

}