// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Podcast extends DataClass implements Insertable<Podcast> {
  final int id;
  final String title;
  final String imageUrl;
  final String thumbnailUrl;
  final String rssUrl;
  final String author;
  final String description;
  Podcast(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.thumbnailUrl,
      @required this.rssUrl,
      @required this.author,
      @required this.description});
  factory Podcast.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Podcast(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      imageUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      thumbnailUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_url']),
      rssUrl:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}rss_url']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    if (!nullToAbsent || rssUrl != null) {
      map['rss_url'] = Variable<String>(rssUrl);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  PodcastsCompanion toCompanion(bool nullToAbsent) {
    return PodcastsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      rssUrl:
          rssUrl == null && nullToAbsent ? const Value.absent() : Value(rssUrl),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Podcast.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Podcast(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      thumbnailUrl: serializer.fromJson<String>(json['thumbnailUrl']),
      rssUrl: serializer.fromJson<String>(json['rssUrl']),
      author: serializer.fromJson<String>(json['author']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'thumbnailUrl': serializer.toJson<String>(thumbnailUrl),
      'rssUrl': serializer.toJson<String>(rssUrl),
      'author': serializer.toJson<String>(author),
      'description': serializer.toJson<String>(description),
    };
  }

  Podcast copyWith(
          {int id,
          String title,
          String imageUrl,
          String thumbnailUrl,
          String rssUrl,
          String author,
          String description}) =>
      Podcast(
        id: id ?? this.id,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        rssUrl: rssUrl ?? this.rssUrl,
        author: author ?? this.author,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Podcast(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('rssUrl: $rssUrl, ')
          ..write('author: $author, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              imageUrl.hashCode,
              $mrjc(
                  thumbnailUrl.hashCode,
                  $mrjc(rssUrl.hashCode,
                      $mrjc(author.hashCode, description.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Podcast &&
          other.id == this.id &&
          other.title == this.title &&
          other.imageUrl == this.imageUrl &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.rssUrl == this.rssUrl &&
          other.author == this.author &&
          other.description == this.description);
}

class PodcastsCompanion extends UpdateCompanion<Podcast> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> imageUrl;
  final Value<String> thumbnailUrl;
  final Value<String> rssUrl;
  final Value<String> author;
  final Value<String> description;
  const PodcastsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.rssUrl = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
  });
  PodcastsCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String imageUrl,
    @required String thumbnailUrl,
    @required String rssUrl,
    @required String author,
    @required String description,
  })  : title = Value(title),
        imageUrl = Value(imageUrl),
        thumbnailUrl = Value(thumbnailUrl),
        rssUrl = Value(rssUrl),
        author = Value(author),
        description = Value(description);
  static Insertable<Podcast> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> imageUrl,
    Expression<String> thumbnailUrl,
    Expression<String> rssUrl,
    Expression<String> author,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (imageUrl != null) 'image_url': imageUrl,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (rssUrl != null) 'rss_url': rssUrl,
      if (author != null) 'author': author,
      if (description != null) 'description': description,
    });
  }

  PodcastsCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> imageUrl,
      Value<String> thumbnailUrl,
      Value<String> rssUrl,
      Value<String> author,
      Value<String> description}) {
    return PodcastsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      rssUrl: rssUrl ?? this.rssUrl,
      author: author ?? this.author,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (rssUrl.present) {
      map['rss_url'] = Variable<String>(rssUrl.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodcastsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('rssUrl: $rssUrl, ')
          ..write('author: $author, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $PodcastsTable extends Podcasts with TableInfo<$PodcastsTable, Podcast> {
  final GeneratedDatabase _db;
  final String _alias;
  $PodcastsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  GeneratedTextColumn _imageUrl;
  @override
  GeneratedTextColumn get imageUrl => _imageUrl ??= _constructImageUrl();
  GeneratedTextColumn _constructImageUrl() {
    return GeneratedTextColumn(
      'image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  GeneratedTextColumn _thumbnailUrl;
  @override
  GeneratedTextColumn get thumbnailUrl =>
      _thumbnailUrl ??= _constructThumbnailUrl();
  GeneratedTextColumn _constructThumbnailUrl() {
    return GeneratedTextColumn(
      'thumbnail_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rssUrlMeta = const VerificationMeta('rssUrl');
  GeneratedTextColumn _rssUrl;
  @override
  GeneratedTextColumn get rssUrl => _rssUrl ??= _constructRssUrl();
  GeneratedTextColumn _constructRssUrl() {
    return GeneratedTextColumn(
      'rss_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  @override
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn(
      'author',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, imageUrl, thumbnailUrl, rssUrl, author, description];
  @override
  $PodcastsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'podcasts';
  @override
  final String actualTableName = 'podcasts';
  @override
  VerificationContext validateIntegrity(Insertable<Podcast> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url'], _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url'], _thumbnailUrlMeta));
    } else if (isInserting) {
      context.missing(_thumbnailUrlMeta);
    }
    if (data.containsKey('rss_url')) {
      context.handle(_rssUrlMeta,
          rssUrl.isAcceptableOrUnknown(data['rss_url'], _rssUrlMeta));
    } else if (isInserting) {
      context.missing(_rssUrlMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author'], _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Podcast map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Podcast.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PodcastsTable createAlias(String alias) {
    return $PodcastsTable(_db, alias);
  }
}

class PodcastEpisode extends DataClass implements Insertable<PodcastEpisode> {
  final int id;
  final int podcastId;
  final String title;
  final String description;
  final String link;
  final int pubDate;
  final String comments;
  final String thumbnailUrl;
  PodcastEpisode(
      {@required this.id,
      @required this.podcastId,
      @required this.title,
      @required this.description,
      @required this.link,
      @required this.pubDate,
      @required this.comments,
      @required this.thumbnailUrl});
  factory PodcastEpisode.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return PodcastEpisode(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      podcastId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}podcast_id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      link: stringType.mapFromDatabaseResponse(data['${effectivePrefix}link']),
      pubDate:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}pub_date']),
      comments: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}comments']),
      thumbnailUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || podcastId != null) {
      map['podcast_id'] = Variable<int>(podcastId);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    if (!nullToAbsent || pubDate != null) {
      map['pub_date'] = Variable<int>(pubDate);
    }
    if (!nullToAbsent || comments != null) {
      map['comments'] = Variable<String>(comments);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    return map;
  }

  PodcastEpisodesCompanion toCompanion(bool nullToAbsent) {
    return PodcastEpisodesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      podcastId: podcastId == null && nullToAbsent
          ? const Value.absent()
          : Value(podcastId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      pubDate: pubDate == null && nullToAbsent
          ? const Value.absent()
          : Value(pubDate),
      comments: comments == null && nullToAbsent
          ? const Value.absent()
          : Value(comments),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
    );
  }

  factory PodcastEpisode.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PodcastEpisode(
      id: serializer.fromJson<int>(json['id']),
      podcastId: serializer.fromJson<int>(json['podcastId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      link: serializer.fromJson<String>(json['link']),
      pubDate: serializer.fromJson<int>(json['pubDate']),
      comments: serializer.fromJson<String>(json['comments']),
      thumbnailUrl: serializer.fromJson<String>(json['thumbnailUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'podcastId': serializer.toJson<int>(podcastId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'link': serializer.toJson<String>(link),
      'pubDate': serializer.toJson<int>(pubDate),
      'comments': serializer.toJson<String>(comments),
      'thumbnailUrl': serializer.toJson<String>(thumbnailUrl),
    };
  }

  PodcastEpisode copyWith(
          {int id,
          int podcastId,
          String title,
          String description,
          String link,
          int pubDate,
          String comments,
          String thumbnailUrl}) =>
      PodcastEpisode(
        id: id ?? this.id,
        podcastId: podcastId ?? this.podcastId,
        title: title ?? this.title,
        description: description ?? this.description,
        link: link ?? this.link,
        pubDate: pubDate ?? this.pubDate,
        comments: comments ?? this.comments,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );
  @override
  String toString() {
    return (StringBuffer('PodcastEpisode(')
          ..write('id: $id, ')
          ..write('podcastId: $podcastId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('link: $link, ')
          ..write('pubDate: $pubDate, ')
          ..write('comments: $comments, ')
          ..write('thumbnailUrl: $thumbnailUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          podcastId.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      link.hashCode,
                      $mrjc(
                          pubDate.hashCode,
                          $mrjc(
                              comments.hashCode, thumbnailUrl.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PodcastEpisode &&
          other.id == this.id &&
          other.podcastId == this.podcastId &&
          other.title == this.title &&
          other.description == this.description &&
          other.link == this.link &&
          other.pubDate == this.pubDate &&
          other.comments == this.comments &&
          other.thumbnailUrl == this.thumbnailUrl);
}

class PodcastEpisodesCompanion extends UpdateCompanion<PodcastEpisode> {
  final Value<int> id;
  final Value<int> podcastId;
  final Value<String> title;
  final Value<String> description;
  final Value<String> link;
  final Value<int> pubDate;
  final Value<String> comments;
  final Value<String> thumbnailUrl;
  const PodcastEpisodesCompanion({
    this.id = const Value.absent(),
    this.podcastId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.link = const Value.absent(),
    this.pubDate = const Value.absent(),
    this.comments = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
  });
  PodcastEpisodesCompanion.insert({
    this.id = const Value.absent(),
    @required int podcastId,
    @required String title,
    @required String description,
    @required String link,
    @required int pubDate,
    @required String comments,
    @required String thumbnailUrl,
  })  : podcastId = Value(podcastId),
        title = Value(title),
        description = Value(description),
        link = Value(link),
        pubDate = Value(pubDate),
        comments = Value(comments),
        thumbnailUrl = Value(thumbnailUrl);
  static Insertable<PodcastEpisode> custom({
    Expression<int> id,
    Expression<int> podcastId,
    Expression<String> title,
    Expression<String> description,
    Expression<String> link,
    Expression<int> pubDate,
    Expression<String> comments,
    Expression<String> thumbnailUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (podcastId != null) 'podcast_id': podcastId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (link != null) 'link': link,
      if (pubDate != null) 'pub_date': pubDate,
      if (comments != null) 'comments': comments,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
    });
  }

  PodcastEpisodesCompanion copyWith(
      {Value<int> id,
      Value<int> podcastId,
      Value<String> title,
      Value<String> description,
      Value<String> link,
      Value<int> pubDate,
      Value<String> comments,
      Value<String> thumbnailUrl}) {
    return PodcastEpisodesCompanion(
      id: id ?? this.id,
      podcastId: podcastId ?? this.podcastId,
      title: title ?? this.title,
      description: description ?? this.description,
      link: link ?? this.link,
      pubDate: pubDate ?? this.pubDate,
      comments: comments ?? this.comments,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (podcastId.present) {
      map['podcast_id'] = Variable<int>(podcastId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (pubDate.present) {
      map['pub_date'] = Variable<int>(pubDate.value);
    }
    if (comments.present) {
      map['comments'] = Variable<String>(comments.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodcastEpisodesCompanion(')
          ..write('id: $id, ')
          ..write('podcastId: $podcastId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('link: $link, ')
          ..write('pubDate: $pubDate, ')
          ..write('comments: $comments, ')
          ..write('thumbnailUrl: $thumbnailUrl')
          ..write(')'))
        .toString();
  }
}

class $PodcastEpisodesTable extends PodcastEpisodes
    with TableInfo<$PodcastEpisodesTable, PodcastEpisode> {
  final GeneratedDatabase _db;
  final String _alias;
  $PodcastEpisodesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _podcastIdMeta = const VerificationMeta('podcastId');
  GeneratedIntColumn _podcastId;
  @override
  GeneratedIntColumn get podcastId => _podcastId ??= _constructPodcastId();
  GeneratedIntColumn _constructPodcastId() {
    return GeneratedIntColumn(
      'podcast_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _linkMeta = const VerificationMeta('link');
  GeneratedTextColumn _link;
  @override
  GeneratedTextColumn get link => _link ??= _constructLink();
  GeneratedTextColumn _constructLink() {
    return GeneratedTextColumn(
      'link',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pubDateMeta = const VerificationMeta('pubDate');
  GeneratedIntColumn _pubDate;
  @override
  GeneratedIntColumn get pubDate => _pubDate ??= _constructPubDate();
  GeneratedIntColumn _constructPubDate() {
    return GeneratedIntColumn(
      'pub_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commentsMeta = const VerificationMeta('comments');
  GeneratedTextColumn _comments;
  @override
  GeneratedTextColumn get comments => _comments ??= _constructComments();
  GeneratedTextColumn _constructComments() {
    return GeneratedTextColumn(
      'comments',
      $tableName,
      false,
    );
  }

  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  GeneratedTextColumn _thumbnailUrl;
  @override
  GeneratedTextColumn get thumbnailUrl =>
      _thumbnailUrl ??= _constructThumbnailUrl();
  GeneratedTextColumn _constructThumbnailUrl() {
    return GeneratedTextColumn(
      'thumbnail_url',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        podcastId,
        title,
        description,
        link,
        pubDate,
        comments,
        thumbnailUrl
      ];
  @override
  $PodcastEpisodesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'podcast_episodes';
  @override
  final String actualTableName = 'podcast_episodes';
  @override
  VerificationContext validateIntegrity(Insertable<PodcastEpisode> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('podcast_id')) {
      context.handle(_podcastIdMeta,
          podcastId.isAcceptableOrUnknown(data['podcast_id'], _podcastIdMeta));
    } else if (isInserting) {
      context.missing(_podcastIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link'], _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('pub_date')) {
      context.handle(_pubDateMeta,
          pubDate.isAcceptableOrUnknown(data['pub_date'], _pubDateMeta));
    } else if (isInserting) {
      context.missing(_pubDateMeta);
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments'], _commentsMeta));
    } else if (isInserting) {
      context.missing(_commentsMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url'], _thumbnailUrlMeta));
    } else if (isInserting) {
      context.missing(_thumbnailUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PodcastEpisode map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PodcastEpisode.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PodcastEpisodesTable createAlias(String alias) {
    return $PodcastEpisodesTable(_db, alias);
  }
}

abstract class _$DatabaseService extends GeneratedDatabase {
  _$DatabaseService(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PodcastsTable _podcasts;
  $PodcastsTable get podcasts => _podcasts ??= $PodcastsTable(this);
  $PodcastEpisodesTable _podcastEpisodes;
  $PodcastEpisodesTable get podcastEpisodes =>
      _podcastEpisodes ??= $PodcastEpisodesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [podcasts, podcastEpisodes];
}
