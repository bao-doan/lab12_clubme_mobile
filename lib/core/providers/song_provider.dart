import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/auth/auth_rest.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:dio/dio.dart';
class SongProvider extends ChangeNotifier {
  final SongRest rest = SongRest();
  final AuthRest auth = AuthRest();
  List<Song> _items = [];
  List<Song> get items => _items;
  List<Song> get list => _items;
  bool fetched = false;
  bool waiting = false;
  bool waitingForAlbum = false;
  bool waitingForArtist = false;

  fetch() async {
    if (!fetched) {
      try {
        waiting = true;
        final List<Song> data = await rest.fetchMultiple();
        _items = data;
        waiting = false;
        fetched = true;
        notifyListeners();
      }
      on DioError catch (e) {
        print('SongProvider $e');
      }

    }
  }

  Future<List<Song>> fetchByArtist(String id) async {
    List<Song> data = [];
    try {
      waitingForArtist = true;
      data = await rest.fetchMultipleByArtist(id);
      print('SongProvider fetchByArtist ${data.length}');
    }
    on DioError catch (e) {
      print('SongProvider fetchByArtist DioError ${e.message}');
    }
    waitingForArtist = false;
    return data;
  }

  Future<List<Song>> fetchByAlbum(String id) async {
    List<Song> data = [];
    try {
      waitingForAlbum = true;
      data = await rest.fetchMultipleByAlbum(id);
      print('SongProvider fetchByAlbum ${data.length}');
    }
    on DioError catch (e) {
      print('SongProvider fetchByAlbum DioError ${e.message}');
    }
    waitingForAlbum = false;
    return data;
  }
}