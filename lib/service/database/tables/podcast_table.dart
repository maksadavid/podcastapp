



import 'package:sqflite/sqlite_api.dart';
import 'package:tutu/core/podcast.dart';
import 'package:tutu/core/podcast_episode.dart';
import 'package:tutu/service/database/database_service.dart';

class PodcastTable implements Table {

  static const String TABLE_NAME = "podcast_table";
  static const String COLUMN_ID = "id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_IMAGE_URL = "image_url";
  static const String COLUMN_THUMBNAIL_URL = "thumbnail_url";
  static const String COLUMN_RSS_URL = "rss_url";
  static const String COLUMN_AUTHOR = "author";
  static const String COLUMN_DESCRIPTION = "description";

  @override
  void onCreate(Database db) {
    db.execute(
      "CREATE TABLE " + TABLE_NAME + " (" +
          COLUMN_ID + " INTEGER PRIMARY KEY, " +
          COLUMN_TITLE + " TEXT, " +
          COLUMN_IMAGE_URL + " TEXT, " +
          COLUMN_THUMBNAIL_URL + " TEXT, " +
          COLUMN_RSS_URL + " TEXT, " +
          COLUMN_AUTHOR + " TEXT, " +
          COLUMN_DESCRIPTION + " TEXT)"
    );
  }

  @override
  void onUpdate(Database db, int oldVersion, int newVersion) {
  }

  static Map<String, dynamic> mapFrom(Podcast podcast) {
    return {
      COLUMN_ID : podcast.id,
      COLUMN_TITLE : podcast.title,
      COLUMN_IMAGE_URL : podcast.imageUrl,
      COLUMN_THUMBNAIL_URL : podcast.thumbnailUrl,
      COLUMN_RSS_URL : podcast.rssUrl,
      COLUMN_AUTHOR : podcast.author,
      COLUMN_DESCRIPTION : podcast.description,
    };
  }

  static Podcast podcastFrom(Map<String, dynamic> map) {
    return Podcast(
      map[COLUMN_ID],
      map[COLUMN_TITLE],
      map[COLUMN_IMAGE_URL],
      map[COLUMN_THUMBNAIL_URL],
      map[COLUMN_RSS_URL],
      map[COLUMN_AUTHOR],
      List<PodcastEpisode>(),
      map[COLUMN_DESCRIPTION],
    );
  }
}

