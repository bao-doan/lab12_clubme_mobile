import 'dart:convert';

import 'package:lab12_clubme_mobile/core/environments/env.dart';
import 'package:lab12_clubme_mobile/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

setupPrefs() async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  // Save an integer value to 'counter' key.
  await prefs.setInt('counter', 10);
  // Save an boolean value to 'repeat' key.
  await prefs.setBool('repeat', true);
  // Save an double value to 'decimal' key.
  await prefs.setDouble('decimal', 1.5);
  // Save an String value to 'action' key.
  await prefs.setString('action', 'Start');
  // Save an list of strings to 'items' key.
  await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
}

readPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the 'counter' key. If it doesn't exist, returns null.
  final int? counter = prefs.getInt('counter');
  // Try reading data from the 'repeat' key. If it doesn't exist, returns null.
  final bool? repeat = prefs.getBool('repeat');
  // Try reading data from the 'decimal' key. If it doesn't exist, returns null.
  final double? decimal = prefs.getDouble('decimal');
  // Try reading data from the 'action' key. If it doesn't exist, returns null.
  final String? action = prefs.getString('action');
  // Try reading data from the 'items' key. If it doesn't exist, returns null.
  final List<String>? items = prefs.getStringList('items');
}

class AppPref {
  static final PREFS_LOCAL_USER = Env.PREFS_LOCAL_USER;
  static final PREFS_LOCAL_FAVORITES = Env.PREFS_LOCAL_FAVORITES;

  static prefs() {
    return SharedPreferences.getInstance();
  }

  /** Local User */

  static setLocalUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PREFS_LOCAL_USER, json.encode(user));
  }

  static Future<User> getLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString(PREFS_LOCAL_USER);
    final data = json.decode(user ?? '');
    final result = User.fromMap(data);
    return result;
  }

  static getLocalToken() async {
    final prefs = await SharedPreferences.getInstance();
    final user = await getLocalUser();
    // return user['access_token'];
  }

  static removeLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
  }

  /** Song, Player data */

  static getAllLocalFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final local = prefs.getStringList(PREFS_LOCAL_FAVORITES);
    print('getAllLocalFavorites $local');
    return local;
  }

  static appendLocalFavorites() async {
    final String id = '62297185cb2e1ef77881ddd2';
    final prefs = await SharedPreferences.getInstance();
    final List<String>? local = prefs.getStringList(PREFS_LOCAL_FAVORITES);
    List<String> list = [];
    if (local != null) {
      final existed = local.indexOf(id);
      print(existed);
      list = existed > -1 ? [...local] : [...local, id];
    } else {
      list = [id];
    }
    print('appendLocalFavorites $list');
    final setting = await prefs.setStringList(PREFS_LOCAL_FAVORITES, list);
  }

  static removeLocalFavorites() async {
    final String id = '62297185cb2e1ef77881ddd2';
    final prefs = await SharedPreferences.getInstance();
    final List<String>? local = prefs.getStringList(PREFS_LOCAL_FAVORITES);
    if (local != null) {
      print('removeLocalFavorites before $local');
      final rm = local.remove(id);
      print('removeLocalFavorites after $local');
      final setting = await prefs.setStringList(PREFS_LOCAL_FAVORITES, local);
    }
  }

  static deleteLocalFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(PREFS_LOCAL_FAVORITES);
  }
}
