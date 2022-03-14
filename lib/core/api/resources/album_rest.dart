import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/rest_client_mixin.dart';
import 'package:lab12_clubme_mobile/core/api/rest_interface.dart';
import 'package:lab12_clubme_mobile/core/models/album_model.dart';

class AlbumRest with RestClientMixin<Album> implements ServiceInterface<Album> {
  @override
  String baseUrl = 'albums';

  @override
  Future<Album> createOne(Album item) {
    // TODO: implement createOne
    throw UnimplementedError();
  }

  @override
  Future<Album> deleteOne(String id, {bool permanent = false}) {
    // TODO: implement deleteOne
    throw UnimplementedError();
  }

  @override
  Future<Album> editOne(String id, Album item) {
    // TODO: implement editOne
    throw UnimplementedError();
  }

  @override
  Future<List<Album>> fetchMultiple() async {
    // TODO: implement fetchMultiple
    final List response = await get(baseUrl);
    final data = response.map((e) => Album.fromMap(e)).toList();
    return data;
    throw UnimplementedError();
  }

  @override
  Future<Album> fetchOne(String id) {
    // TODO: implement fetchOne
    throw UnimplementedError();
  }

}