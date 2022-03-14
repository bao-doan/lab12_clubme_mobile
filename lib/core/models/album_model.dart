import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'package:lab12_clubme_mobile/core/models/image_model.dart';

class Album extends BaseModel {
  String? title;

  Artist? artist;

  Image? image;

  Album({
    this.title,
    this.artist,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'artist': this.artist,
      'image': this.image,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      title: map['title'] as String,
      artist: Artist.fromMap(map['artist']),
      image: Image.fromMap(map['image']),
    );
  }
}