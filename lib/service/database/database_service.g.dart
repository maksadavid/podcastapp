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
  factory Podcast.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
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
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'thumbnailUrl': serializer.toJson<String>(thumbnailUrl),
      'rssUrl': serializer.toJson<String>(rssUrl),
      'author': serializer.toJson<String>(author),
      'description': serializer.toJson<String>(description),
    };
  }

  @override
  PodcastsCompanion createCompanion(bool nullToAbsent) {
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
  bool operator ==(other) =>
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
  VerificationContext validateIntegrity(PodcastsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.imageUrl.present) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableValue(d.imageUrl.value, _imageUrlMeta));
    } else if (imageUrl.isRequired && isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (d.thumbnailUrl.present) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableValue(
              d.thumbnailUrl.value, _thumbnailUrlMeta));
    } else if (thumbnailUrl.isRequired && isInserting) {
      context.missing(_thumbnailUrlMeta);
    }
    if (d.rssUrl.present) {
      context.handle(
          _rssUrlMeta, rssUrl.isAcceptableValue(d.rssUrl.value, _rssUrlMeta));
    } else if (rssUrl.isRequired && isInserting) {
      context.missing(_rssUrlMeta);
    }
    if (d.author.present) {
      context.handle(
          _authorMeta, author.isAcceptableValue(d.author.value, _authorMeta));
    } else if (author.isRequired && isInserting) {
      context.missing(_authorMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (description.isRequired && isInserting) {
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
  Map<String, Variable> entityToSql(PodcastsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.imageUrl.present) {
      map['image_url'] = Variable<String, StringType>(d.imageUrl.value);
    }
    if (d.thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String, StringType>(d.thumbnailUrl.value);
    }
    if (d.rssUrl.present) {
      map['rss_url'] = Variable<String, StringType>(d.rssUrl.value);
    }
    if (d.author.present) {
      map['author'] = Variable<String, StringType>(d.author.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    return map;
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
  factory PodcastEpisode.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
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
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
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

  @override
  PodcastEpisodesCompanion createCompanion(bool nullToAbsent) {
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
  bool operator ==(other) =>
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
  VerificationContext validateIntegrity(PodcastEpisodesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.podcastId.present) {
      context.handle(_podcastIdMeta,
          podcastId.isAcceptableValue(d.podcastId.value, _podcastIdMeta));
    } else if (podcastId.isRequired && isInserting) {
      context.missing(_podcastIdMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (description.isRequired && isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.link.present) {
      context.handle(
          _linkMeta, link.isAcceptableValue(d.link.value, _linkMeta));
    } else if (link.isRequired && isInserting) {
      context.missing(_linkMeta);
    }
    if (d.pubDate.present) {
      context.handle(_pubDateMeta,
          pubDate.isAcceptableValue(d.pubDate.value, _pubDateMeta));
    } else if (pubDate.isRequired && isInserting) {
      context.missing(_pubDateMeta);
    }
    if (d.comments.present) {
      context.handle(_commentsMeta,
          comments.isAcceptableValue(d.comments.value, _commentsMeta));
    } else if (comments.isRequired && isInserting) {
      context.missing(_commentsMeta);
    }
    if (d.thumbnailUrl.present) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableValue(
              d.thumbnailUrl.value, _thumbnailUrlMeta));
    } else if (thumbnailUrl.isRequired && isInserting) {
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
  Map<String, Variable> entityToSql(PodcastEpisodesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.podcastId.present) {
      map['podcast_id'] = Variable<int, IntType>(d.podcastId.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.link.present) {
      map['link'] = Variable<String, StringType>(d.link.value);
    }
    if (d.pubDate.present) {
      map['pub_date'] = Variable<int, IntType>(d.pubDate.value);
    }
    if (d.comments.present) {
      map['comments'] = Variable<String, StringType>(d.comments.value);
    }
    if (d.thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String, StringType>(d.thumbnailUrl.value);
    }
    return map;
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
  List<TableInfo> get allTables => [podcasts, podcastEpisodes];
}
