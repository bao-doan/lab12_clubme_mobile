import 'dart:convert';

import 'package:lab12_clubme_mobile/core/models/album_model.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/models/audio_model.dart';
import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'package:lab12_clubme_mobile/core/models/image_model.dart';

class Song extends BaseModel {
  String? title;

  Audio? audio;

  Image? image;

  Artist? artist;

  Album? album;

  Song({
    this.title,
    this.audio,
    this.image,
    this.artist,
    this.album,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'audio': this.audio,
      'image': this.image,
      'artist': this.artist,
      'album': this.album,
    };
  }

  String toJson() => json.encode(toMap());

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      title: map['title'] as String,
      audio: Audio.fromMap(map['audio']),
      image: map['image'] != null ? Image.fromMap(map['image'] ?? '') : Image(),
      artist: Artist.fromMap(map['artist']),
      album: Album.fromMap(map['album']),
    );
  }

  static fromJson(String json_string) => Song.fromMap(json.decode(json_string));


}