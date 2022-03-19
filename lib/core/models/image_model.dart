import 'package:lab12_clubme_mobile/core/models/base_model.dart';

class Image implements BaseModel {
  String? access_mode;

  String? asset_id;

  int? bytes;

  String? created_at;

  String? etag;

  String? format;

  int? height;

  String? original_filename;

  bool? placeholder;

  String? public_id;

  String? resource_type;

  String? secure_url;

  String? signature;

  // List<dynamic>? tags;

  String? type;

  String? url;

  int? version;

  String? version_id;

  int? width;



  Image({
    this.access_mode,
    this.asset_id,
    this.bytes,
    this.created_at,
    this.etag,
    this.format,
    this.height,
    this.original_filename,
    this.placeholder,
    this.public_id,
    this.resource_type,
    this.secure_url,
    this.signature,
    this.type,
    this.url,
    this.version,
    this.version_id,
    this.width,
    this.createdAt,
    this.status,
    this.uid,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_mode': this.access_mode,
      'asset_id': this.asset_id,
      'bytes': this.bytes,
      'created_at': this.created_at,
      'etag': this.etag,
      'format': this.format,
      'height': this.height,
      'original_filename': this.original_filename,
      'placeholder': this.placeholder,
      'public_id': this.public_id,
      'resource_type': this.resource_type,
      'secure_url': this.secure_url,
      'signature': this.signature,
      'type': this.type,
      'url': this.url,
      'version': this.version,
      'version_id': this.version_id,
      'width': this.width,
      'createdAt': this.createdAt,
      'status': this.status,
      'uid': this.uid,
      'updatedAt': this.updatedAt,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      access_mode: map['access_mode'] as String,
      asset_id: map['asset_id'] as String,
      bytes: map['bytes'] as int,
      created_at: map['created_at'] as String,
      etag: map['etag'] as String,
      format: map['format'] as String,
      height: map['height'] as int,
      original_filename: map['original_filename'] as String,
      placeholder: map['placeholder'] as bool,
      public_id: map['public_id'] as String,
      resource_type: map['resource_type'] as String,
      secure_url: map['secure_url'] as String,
      signature: map['signature'] as String,
      type: map['type'] as String,
      url: map['url'] as String,
      version: map['version'] as int,
      version_id: map['version_id'] as String,
      width: map['width'] as int,
      createdAt: map['createdAt'] as String,
      status: map['status'] as String,
      uid: map['uid'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  @override
  String? createdAt;

  @override
  String? status;

  @override
  String? uid;

  @override
  String? updatedAt;
}