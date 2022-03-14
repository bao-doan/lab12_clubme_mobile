import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'package:lab12_clubme_mobile/core/models/image_model.dart';
import 'package:lab12_clubme_mobile/core/models/user_model.dart';

class Artist extends BaseModel {
  String? name;

  String? title;

  Image? image;

  String? user;

  Artist({
    this.name,
    this.title,
    this.image,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'title': this.title,
      'image': this.image,
      'user': this.user,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      name: map['name'] as String,
      title: map['title'] as String,
      image: Image.fromMap(map['image']),
      user: map['user'] ?? 'no_user',
    );
  }
}