

import 'package:http/http.dart' as http;
import 'package:tutu/core/itunes_podcast_search_result.dart';
import 'dart:convert';

import 'package:tutu/service/itunes_podcast_service.dart';


class ServiceHolder {

  static final ITunesPodcastService iTunesPodcastService = ITunesPodcastService();
}

