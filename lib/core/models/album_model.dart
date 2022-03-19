import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'package:lab12_clubme_mobile/core/models/image_model.dart';

class Album implements BaseModel {
  String? title;

  Artist? artist;

  Image? image;

  @override
  String? createdAt;

  @override
  String? status;

  @override
  String? uid;

  @override
  String? updatedAt;

  Album({
    this.title,
    this.artist,
    this.image,
    this.createdAt,
    this.status,
    this.uid,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'artist': this.artist,
      'image': this.image,
      'createdAt': this.createdAt,
      'status': this.status,
      'uid': this.uid,
      'updatedAt': this.updatedAt,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      title: map['title'] as String,
      artist: Artist.fromMap(map['artist']),
      image: Image.fromMap(map['image']),
      createdAt: map['createdAt'] as String,
      status: map['status'] as String,
      uid: map['uid'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  @override
  String toString() {
    return 'Album{title: $title, artist: $artist, image: $image, createdAt: $createdAt, status: $status, uid: $uid, updatedAt: $updatedAt}';
  }
}