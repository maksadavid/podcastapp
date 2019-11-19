


import 'package:sqflite/sqflite.dart';
import 'package:tutu/service/database/storage/podcast_storage.dart';
import 'package:tutu/service/database/tables/podcast_episode_table.dart';
import 'package:tutu/service/database/tables/podcast_table.dart';

abstract class Table {
  void onCreate(Database db);
  void onUpdate(Database db, int oldVersion, int newVersion);
}

class DatabaseService {

  PodcastStorage podcastStorage;
  List<Table> tables = [
    PodcastTable(),
    PodcastEpisodeTable(),
  ];

  Future<bool> init() async {
    Database database = await openDatabase('database.db',
      onCreate: (db, version) {
        tables.forEach((table) {
          table.onCreate(db);
        });
      },
      onUpgrade: (db, oldVersion, newVersion) {
        tables.forEach((table) {
          table.onUpdate(db, oldVersion, newVersion);
        });
      },
      version: 1,
    );

    podcastStorage = PodcastStorage(database);

    return true;
  }
}

