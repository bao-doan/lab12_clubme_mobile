import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/rest_client_mixin.dart';
import 'package:lab12_clubme_mobile/core/api/rest_interface.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';

class ArtistRest with RestClientMixin<Artist> implements ServiceInterface<Artist> {

  @override
  String baseUrl = 'artists';

  @override
  Future<Artist> createOne(Artist item) {
    // TODO: implement createOne
    throw UnimplementedError();
  }

  @override
  Future<Artist> deleteOne(String id, {bool permanent = false}) {
    // TODO: implement deleteOne
    throw UnimplementedError();
  }

  @override
  Future<Artist> editOne(String id, Artist item) {
    // TODO: implement editOne
    throw UnimplementedError();
  }

  @override
  Future<List<Artist>> fetchMultiple() async {
    // TODO: implement fetchMultiple
    final List response = await get(baseUrl);
    final data = response.map((e) => Artist.fromMap(e)).toList();
    return data;
    throw UnimplementedError();
  }

  @override
  Future<Artist> fetchOne(String id) {
    // TODO: implement fetchOne
    throw UnimplementedError();
  }


}