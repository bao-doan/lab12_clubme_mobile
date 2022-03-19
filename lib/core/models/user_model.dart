
import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'dart:convert';

class User implements BaseModel {
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? password;
  String? avatar;
  bool? active;
  String? role;


  @override
  String? createdAt;

  @override
  String? status;

  @override
  String? uid;

  @override
  String? updatedAt;

  User({
    this.firstname,
    this.lastname,
    this.email,
    this.username,
    this.password,
    this.avatar,
    this.active,
    this.role,
    this.createdAt,
    this.status,
    this.uid,
    this.updatedAt,
  });

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
      'createdAt': this.createdAt,
      'status': this.status,
      'uid': this.uid,
      'updatedAt': this.updatedAt,
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
      active: map['active'] as bool,
      role: map['role'] as String,
      createdAt: map['createdAt'] as String,
      status: map['status'] as String,
      uid: map['uid'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  @override
  String toString() {
    return 'User{firstname: $firstname, lastname: $lastname, email: $email, username: $username, password: $password, avatar: $avatar, active: $active, role: $role, createdAt: $createdAt, status: $status, uid: $uid, updatedAt: $updatedAt}';
  }
}