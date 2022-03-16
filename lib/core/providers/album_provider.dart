import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lab12_clubme_mobile/core/api/resources/album_rest.dart';
import 'package:lab12_clubme_mobile/core/models/album_model.dart';
import 'package:lab12_clubme_mobile/core/providers/data_provider_interface.dart';

class AlbumProvider extends ChangeNotifier implements DataProviderInterface<Album, AlbumRest> {
  @override
  bool fetched = false;

  @override
  List<Album> _items = [];

  List<Album> get items => _items;

  set items(List<Album> value) {
    _items = value;
  }

  @override
  List<Album> _list = [];

  List<Album> get list => _list;

  set list(List<Album> value) {
    _list = value;
  }

  @override
  AlbumRest restClient = AlbumRest();

  @override
  bool waiting = false;


  AlbumProvider() {
   fetch();
  }

  @override
  Future fetch() async{
    // TODO: implement fetch
    if (!fetched) {
      try {
        waiting = true;
        final List<Album> data = await restClient.fetchMultiple();
        _items = data;
        waiting = false;
        fetched = true;
        notifyListeners();
      }
      catch (e) {
        print('ArtistProvider ${e.toString()} $e');
      }

    }
    // throw UnimplementedError();
  }

  Future<List<Album>> fetchByArtist(String id) async {
    List<Album> data = [];
    try {
      data = await restClient.fetchMultipleByArtist(id);
      print('AlbumProvider fetchByArtist ${data.length}');
    }
    on DioError catch (e) {
      print('AlbumProvider fetchByArtist DioError ${e.message}');
    }
    return data;
  }

}