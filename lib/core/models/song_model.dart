import 'dart:convert';

import 'package:lab12_clubme_mobile/core/models/album_model.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/models/audio_model.dart';
import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'package:lab12_clubme_mobile/core/models/image_model.dart';

class Song implements BaseModel {
  String? title;

  Audio? audio;

  Image? image;

  Artist? artist;

  Album? album;

  String toJson() => json.encode(toMap());

  static fromJson(String json_string) => Song.fromMap(json.decode(json_string));

  @override
  String? createdAt;

  @override
  String? status;

  @override
  String? uid;

  @override
  String? updatedAt;

  Song({
    this.title,
    this.audio,
    this.image,
    this.artist,
    this.album,
    this.createdAt,
    this.status,
    this.uid,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'audio': this.audio,
      'image': this.image,
      'artist': this.artist,
      'album': this.album,
      'createdAt': this.createdAt,
      'status': this.status,
      'uid': this.uid,
      'updatedAt': this.updatedAt,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      title: map['title'] as String,
      image: map['image'] != null ? Image.fromMap(map['image'] ?? '') : Image(),
      audio: Audio.fromMap(map['audio']),
      artist: Artist.fromMap(map['artist']),
      album: Album.fromMap(map['album']),
      createdAt: map['createdAt'] as String,
      status: map['status'] as String,
      uid: map['uid'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  @override
  String toString() {
    return 'Song{title: $title, audio: $audio, image: $image, artist: $artist, album: $album, createdAt: $createdAt, status: $status, uid: $uid, updatedAt: $updatedAt}';
  }
}