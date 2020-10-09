
import 'package:moor_flutter/moor_flutter.dart';

part 'database_service.g.dart';

class Podcasts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get imageUrl => text()();
  TextColumn get thumbnailUrl => text()();
  TextColumn get rssUrl => text()();
  TextColumn get author => text()();
  TextColumn get description => text()();
}

class PodcastEpisodes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get podcastId => integer()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get link => text()();
  IntColumn get pubDate => integer()(); // unix timestamp
  TextColumn get comments => text()();
  TextColumn get thumbnailUrl => text()();
}

@UseMoor(tables: [Podcasts, PodcastEpisodes])
class DatabaseService extends _$DatabaseService {
  DatabaseService() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;

  Stream<List<Podcast>> watchPodcasts() => select(podcasts).watch();
  Future<int> savePodcast(Podcast podcast) async => await into(podcasts).insert(podcast);
  // Future<void> saveEpisodes(List<PodcastEpisode> episodes) async => await into(podcastEpisodes).in
}

