import 'package:lab12_clubme_mobile/core/models/user_model.dart';

class AuthReponseModel extends User {
  String access_token;

  AuthReponseModel({
    required this.access_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_token': this.access_token,
    };
  }

  factory AuthReponseModel.fromMap(Map<String, dynamic> map) {
    return AuthReponseModel(
      access_token: map['access_token'] as String,
    );
  }

  @override
  String toString() {
    return 'AuthReponseModel{access_token: $access_token}';
  }
}