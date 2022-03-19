import 'package:dio/dio.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';

abstract class ServiceInterface<T> {
  late String baseUrl;
  Future<List<T>> fetchMultiple();
  Future<T> fetchOne(String id);
  Future<T> createOne(T item);
  Future<T> editOne(String id, T item);
  Future<T> deleteOne(String id, { bool permanent });
}