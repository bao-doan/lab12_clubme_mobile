
import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'dart:convert';

class User extends BaseModel {
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? password;
  String? avatar;
  String? active;
  String? role;


  Map<String, dynamic> toMap() {
    return {
      'firstname': this.firstname,
      'lastname': this.lastname,
      'email': this.email,
      'username': this.username,
      'password': this.password,
      'avatar': this.avatar,
      'active': this.active,
      'role': this.role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      avatar: map['avatar'] as String,
      active: map['active'] as String,
      role: map['role'] as String,
    );
  }

  User({
    this.firstname,
    this.lastname,
    this.email,
    this.username,
    this.password,
    this.avatar,
    this.active,
    this.role,
  });
}