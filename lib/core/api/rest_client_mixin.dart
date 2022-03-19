import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lab12_clubme_mobile/core/api/rest_query.dart';
import 'package:lab12_clubme_mobile/core/environments/env.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';



class DioClient {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST TO ' + options.uri.path);
        options.headers = buildHeaders(
            token: 'example_access_token',
        );
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
          print('${error.type}');
          return handler.next(error);
      }
    ));
    return _dio;
  }

  Map<String, dynamic> buildHeaders({String token = ''}) {
    final bearerToken = 'Bearer $token';
    return {
      'Authorization': bearerToken,
    };
  }


}

mixin RestClientMixin<T> {
  final RESOURCE_API = Env.RESOURCE_API;

  Dio dioClient = DioClient().init();



  Future<List> get(String path, {RestQuery? query}) async {
    query = query ?? RestQuery();
    List data = [];
    try {
      final Response<List> response = await dioClient.get<List>(buildUri(path),
          queryParameters: query.toMap(),
      );
      if (response.data != null) {
        data = response.data!;
      }
    }
    catch (e) {}
    return data;

  }

  Future post(String path, body, Map<String, dynamic> params) async {
    final uri = '$RESOURCE_API/$path';
    dynamic data;
    try {
      final response = await dioClient.post(
        uri,
        data: body,
        queryParameters: params,
      );
      if (response.data != null) {
        data = response.data!;
      }
    }
    catch (e) {

    }
    return data;
  }

  Future put(String path, body, Map<String, dynamic> params) async {
    final uri = '$RESOURCE_API/$path';
    return dioClient.post(
      uri,
      data: body,
      queryParameters: params,
    );
  }

  Future delete(String path, {bool permanent = false}) async {
    final uri = '$RESOURCE_API/$path';
    return dioClient.delete(
      uri,
      queryParameters: {
        'permanent': permanent,
      },
    );
  }

  String buildUri(String path) {
    return '$RESOURCE_API/$path';
  }

}



