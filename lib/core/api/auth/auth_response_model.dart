import 'package:lab12_clubme_mobile/core/models/user_model.dart';

class AuthReponseModel {
  String access_token;
  String? firstname;
  String? lastname;
  String? email;
  String? avatar;
  bool? active;
  String? uid;


  @override
  String toString() {
    return 'AuthReponseModel{access_token: $access_token, firstname: $firstname, lastname: $lastname, email: $email, avatar: $avatar, active: $active, uid: $uid}';
  }

  AuthReponseModel({
    required this.access_token,
    this.firstname,
    this.lastname,
    this.email,
    this.avatar,
    this.active,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_token': this.access_token,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'email': this.email,
      'avatar': this.avatar,
      'active': this.active,
      'uid': this.uid,
    };
  }

  factory AuthReponseModel.fromMap(Map<String, dynamic> map) {
    return AuthReponseModel(
      access_token: map['access_token'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] ?? '' as String,
      active: map['active'] as bool,
      uid: map['uid'] ?? map['_id'] as String,
    );
  }
}