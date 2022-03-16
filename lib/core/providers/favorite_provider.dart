

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';

class FavoriteProvider extends ChangeNotifier {
  SongRest songRest = SongRest();
  List<Song> _songs = [];
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  List<Song> get songs => _songs;

  FavoriteProvider() {
    // retrieveIdList();
  }

  isFavorite(Song song) {
    final id = song.uid ?? '';
    return favorites.contains(id);
  }

  getFavoriteList() async {
    final localFavs = await AppPref.getAllLocalFavorites();
    _favorites = localFavs ?? [];
    return localFavs;
  }

  fetchSongsForFavorites() async {
    print('FavoriteProvider fetchSongsForFavorites');
    final localFavs = await getFavoriteList();
    if (localFavs != null) {
      try {
        final List<Song> data = await songRest.fetchWithList(localFavs);
        _songs = data;
      }
      on DioError catch (e) {
        print('FavoriteProvider fetchSongsForFavorites DioError ${e.response?.statusMessage}');
      }
    }
    notifyListeners();
  }

  setFavoriteSong(Song song) async {
    final id = song.uid ?? '';
    if (id.isNotEmpty) {
      await AppPref.appendLocalFavorites(id);
      await getFavoriteList();
      notifyListeners();
    }
  }

  removeFavoriteSong(Song song) async {
    final id = song.uid ?? '';
    if (id.isNotEmpty) {
      await AppPref.removeLocalFavorites(id);
      await getFavoriteList();
      notifyListeners();
    }
  }
}