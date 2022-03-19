import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/image_model.dart' as ImageModel;
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/ui/utils/asset_image.dart';

class PayloadHelper {
  static imageFromImage(ImageModel.Image? image) {
    String uri = image?.secure_url ?? '';
    return imageFromUri(uri);
  }
  static imageFromSong(Song? song) {
    String uri = song?.image?.secure_url ?? '';
    return imageFromUri(uri);
  }
  static imageFromUri(String? uri) {
    uri = uri ?? '';
    return uri.isEmpty
        ? AssetImage(AppImage.album_default)
        : NetworkImage(uri);
  }
}