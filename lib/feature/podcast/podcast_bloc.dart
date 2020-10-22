

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/service/service_holder.dart';
import 'package:tutu/feature/podcast/podcast_repository.dart';


class PodcastBloc extends Bloc<Podcast, Podcast> {

  PodcastRepository _repository;
  
  PodcastBloc(this._repository, podcast) : super(podcast) {
    _repository.getPodcastStream().listen((podcast) {
      if(podcast != null) {
        add(podcast);
      }
    });
  }

  void subscribeToPodcast() {
    ServiceHolder.databaseService.savePodcast(state);
  }

  @override
  Stream<Podcast> mapEventToState(Podcast event) async* {
    yield event;
  }
}

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