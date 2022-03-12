import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:dio/dio.dart';
class SongProvider extends ChangeNotifier {
  final SongRest rest = SongRest();
  List<Song> _items = [];
  List<Song> get items => _items;
  List<Song> get list => _items;
  bool fetched = false;
  bool waiting = false;
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
      catch (e) {
        print(e);
      }

    }
  }
}