import 'package:lab12_clubme_mobile/core/api/rest_client_mixin.dart';
import 'package:dio/dio.dart';
import 'package:lab12_clubme_mobile/core/api/rest_interface.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';

class SongRest with RestClientMixin<Song> implements ServiceInterface<Song> {
  String baseUrl = 'songs';
  // Future<Response<List<Song>>> getSongs() {
  //   return get(baseUrl);
  // }

  @override
  Future<Song> createOne(item) {
    // TODO: implement createOne
    throw UnimplementedError();
  }

  @override
  Future<Song> deleteOne(String id, {bool permanent = true}) {
    // TODO: implement deleteOne
    throw UnimplementedError();
  }

  @override
  Future<Song> editOne(String id, item) {
    // TODO: implement editOne
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchMultiple() async {
    final List response = await get(baseUrl);
    // print(response);
    final data = response.map((e) => Song.fromMap(e)).toList();
    return data;
  }

  @override
  Future<Song> fetchOne(String id) {
    // TODO: implement fetchOne
    throw UnimplementedError();
  }



}