import 'dart:convert';

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
  static prefs() {
    return SharedPreferences.getInstance();
  }

  static setLocalUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('clubme_user', json.encode(user));
  }

  static Future<User> getLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('clubme_user');
    final data = json.decode(user ?? '');
    final result = User.fromMap(data);
    return result;
  }
  static getLocalToken() async {
    final prefs = await SharedPreferences.getInstance();
    final user = await getLocalUser();
    // return user['access_token'];
  }

  static removeLocalUser() async{
    final prefs = await SharedPreferences.getInstance();
  }

  /** Song, Player data */

  static String LOCAL_FAVORITES_TOKEN = 'local_favorites';

  static getAllLocalFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final local = prefs.getStringList(LOCAL_FAVORITES_TOKEN);
    print('local $local');
    return local;

  }
  static appendLocalFavorites() async {
    final String id = '62297185cb2e1ef77881ddd2';
    // 62297185cb2e1ef77881ddd2
    final prefs = await SharedPreferences.getInstance();
    final List<String>? local = prefs.getStringList(LOCAL_FAVORITES_TOKEN);
    List<String> list = [];
    if (local != null) {
      final existed = local.indexOf(id);
      print(existed);
      list = existed > -1 ? [...local] : [...local, id];
    } else {
      list = [id];
    }
    print('local list $list');
    final setting = await prefs.setStringList(LOCAL_FAVORITES_TOKEN, list);
  }
  static removeLocalFavorites() async {
    final String id = '62297185cb2e1ef77881ddd2';
    final prefs = await SharedPreferences.getInstance();
    final List<String>? local = prefs.getStringList(LOCAL_FAVORITES_TOKEN);
    if (local != null) {
      print('local before $local');
      final rm = local.remove(id);
      print('local after $local');
      final setting = await prefs.setStringList(LOCAL_FAVORITES_TOKEN, local);
    }

  }

  static deleteLocalFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(LOCAL_FAVORITES_TOKEN);
  }
}