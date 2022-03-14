import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'package:lab12_clubme_mobile/core/models/image_model.dart';
import 'package:lab12_clubme_mobile/core/models/user_model.dart';

class Artist implements BaseModel {
  String? name;

  String? title;

  Image? image;

  String? user;


  @override
  String toString() {
    return 'Artist{name: $name, title: $title, image: $image, user: $user, createdAt: $createdAt, status: $status, uid: $uid, updatedAt: $updatedAt}';
  }

  @override
  String? createdAt;

  @override
  String? status;

  @override
  String? uid;

  @override
  String? updatedAt;

  Artist({
    this.name,
    this.title,
    this.image,
    this.user,
    this.createdAt,
    this.status,
    this.uid,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'title': this.title,
      'image': this.image,
      'user': this.user,
      'createdAt': this.createdAt,
      'status': this.status,
      'uid': this.uid,
      'updatedAt': this.updatedAt,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      name: map['name'] as String,
      title: map['title'] as String,
      image: map['image'] != null ? Image.fromMap(map['image']) : Image(),
      user: map['user'] != null ?  map['user']?.toString() : 'no_user',
      createdAt: map['createdAt'] as String,
      status: map['status'] as String,
      uid: map['uid'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }
}