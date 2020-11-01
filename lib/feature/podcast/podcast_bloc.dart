

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutu/core/log.dart';
import 'package:tutu/service/database/database_service.dart';
import 'package:tutu/service/service_holder.dart';
import 'package:tutu/feature/podcast/podcast_repository.dart';


class PodcastBloc extends Bloc<PodcastBlockEvent, PodcastBlocState> {

  PodcastRepository _repository;
  
  PodcastBloc(this._repository, podcast) : super(PodcastBlocState(podcast, false)) {
    _repository.getPodcastStream().listen((event) {
      if(event is PodcastUpdateEvent && event?.podcast != null) {
        Log.d("PodcastBloc received new PodcastUpdateEvent");
        add(event);
      }
    });
  }

  void subscribeToPodcast() {
    ServiceHolder.databaseService.savePodcast(state.podcast);
  }

  @override
  Stream<PodcastBlocState> mapEventToState(PodcastBlockEvent event) async* {
    if (event is PodcastUpdateEvent) {
      yield PodcastBlocState(event.podcast, event.isSubscribed);
    }
  }
}

class PodcastBlocState {

  Podcast podcast;
  bool isSubscribed;

  PodcastBlocState(this.podcast, this.isSubscribed);
}
