



import 'package:sqflite/sqlite_api.dart';
import 'package:tutu/core/podcast_episode.dart';
import 'package:tutu/service/database/database_service.dart';

class PodcastEpisodeTable implements Table {

  static const String TABLE_NAME = "podcast_episode_table";
  static const String COLUMN_ID = "id";
  static const String COLUMN_PODCAST_ID = "podcast_id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_DESCRIPTION = "description";
  static const String COLUMN_LINK = "link";
  static const String COLUMN_PUB_DATE = "pub_date";
  static const String COLUMN_COMMENTS = "comments";

  @override
  void onCreate(Database db) {
    db.execute(
      "CREATE TABLE $TABLE_NAME ("
          "$COLUMN_ID INTEGER PRIMARY KEY, "
          "$COLUMN_PODCAST_ID INTEGER, "
          "$COLUMN_TITLE TEXT, "
          "$COLUMN_DESCRIPTION  TEXT, "
          "$COLUMN_LINK TEXT, "
          "$COLUMN_PUB_DATE TEXT, "
          "$COLUMN_COMMENTS TEXT)"
    );
  }

  @override
  void onUpdate(Database db, int oldVersion, int newVersion) {
  }

  static Map<String, dynamic> mapFrom(PodcastEpisode episode) {
    return {
      COLUMN_ID : episode.id,
      COLUMN_PODCAST_ID : episode.podcastId,
      COLUMN_TITLE : episode.title,
      COLUMN_DESCRIPTION : episode.description,
      COLUMN_LINK : episode.link,
      COLUMN_PUB_DATE : episode.pubDate,
      COLUMN_COMMENTS : episode.comments,
    };
  }

  static PodcastEpisode podcastEpisodeFrom(Map<String, dynamic> map) {
    PodcastEpisode episode = PodcastEpisode(
      map[COLUMN_ID],
      map[COLUMN_PODCAST_ID],
      map[COLUMN_TITLE],
      map[COLUMN_DESCRIPTION],
      map[COLUMN_LINK],
      map[COLUMN_PUB_DATE],
      map[COLUMN_COMMENTS],
    );
    return episode;
  }
}

