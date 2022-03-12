
import 'package:lab12_clubme_mobile/core/models/base_model.dart';
import 'package:lab12_clubme_mobile/core/models/cloudinary_meta_model.dart';

class Audio extends BaseModel {

  String? access_mode;

  String? asset_id;

  CloudinaryAudioMeta? audio;

  int? bit_rate;

  int? bytes;

  String? created_at;

  double? duration;

  String? etag;

  String? format;

  int? height;

  bool? is_audio;

  String? original_filename;

  int? pages;

  bool? placeholder;

  String? public_id;

  String? resource_type;

  String? secure_url;

  String? signature;

  List<dynamic>? tags;

  String? type;

  String? url;

  int? version;

  String? version_id;

  // CloudinaryVideoMeta? video;

  int? width;

  Audio({
    this.access_mode,
    this.asset_id,
    this.audio,
    this.bit_rate,
    this.bytes,
    this.created_at,
    this.duration,
    this.etag,
    this.format,
    this.height,
    this.is_audio,
    this.original_filename,
    this.pages,
    this.placeholder,
    this.public_id,
    this.resource_type,
    this.secure_url,
    this.signature,
    this.tags,
    this.type,
    this.url,
    this.version,
    this.version_id,
    this.width,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_mode': this.access_mode,
      'asset_id': this.asset_id,
      'audio': this.audio,
      'bit_rate': this.bit_rate,
      'bytes': this.bytes,
      'created_at': this.created_at,
      'duration': this.duration,
      'etag': this.etag,
      'format': this.format,
      'height': this.height,
      'is_audio': this.is_audio,
      'original_filename': this.original_filename,
      'pages': this.pages,
      'placeholder': this.placeholder,
      'public_id': this.public_id,
      'resource_type': this.resource_type,
      'secure_url': this.secure_url,
      'signature': this.signature,
      'tags': this.tags,
      'type': this.type,
      'url': this.url,
      'version': this.version,
      'version_id': this.version_id,
      'width': this.width,
    };
  }

  factory Audio.fromMap(Map<String, dynamic> map) {
    return Audio(
      access_mode: map['access_mode'] as String,
      asset_id: map['asset_id'] as String,
      audio: CloudinaryAudioMeta.fromMap(map['audio']) as CloudinaryAudioMeta,
      bit_rate: map['bit_rate'] as int,
      bytes: map['bytes'] as int,
      created_at: map['created_at'] as String,
      duration: map['duration'] as double,
      etag: map['etag'] as String,
      format: map['format'] as String,
      height: map['height'] as int,
      is_audio: map['is_audio'] as bool,
      original_filename: map['original_filename'] as String,
      pages: map['pages'] as int,
      placeholder: map['placeholder'] as bool,
      public_id: map['public_id'] as String,
      resource_type: map['resource_type'] as String,
      secure_url: map['secure_url'] as String,
      signature: map['signature'] as String,
      tags: map['tags'] as List<dynamic>,
      type: map['type'] as String,
      url: map['url'] as String,
      version: map['version'] as int,
      version_id: map['version_id'] as String,
      width: map['width'] as int,
    );
  }
}