

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/feature/podcast/podcast_repository.dart';

class PodcastEpisodeListBloc extends Bloc<List<PodcastEpisode>, List<PodcastEpisode>> {
  PodcastRepository _repository;

  PodcastEpisodeListBloc(this._repository, episodes) : super(episodes) {
    _repository.getPodcastEpisodeStream().listen((event) {
      if(event != null && event is List<PodcastEpisode> && event.isNotEmpty) {
        add(event);
      }
    });
  }

  @override
  Stream<List<PodcastEpisode>> mapEventToState(List<PodcastEpisode> event) async* {
    yield event;
  }
}