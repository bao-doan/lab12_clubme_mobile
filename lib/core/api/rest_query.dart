class RestQuery {
  bool? populate;
  String? album;
  String? artist;

  RestQuery({
    this.populate = true,
    this.album,
    this.artist,
  });

  Map<String, dynamic> toMap() {
    return {
      'populate': this.populate,
      'album': this.album,
      'artist': this.artist,
    };
  }

  factory RestQuery.fromMap(Map<String, dynamic> map) {
    return RestQuery(
      populate: map['populate'] as bool,
      album: map['album'] as String,
      artist: map['artist'] as String,
    );
  }
}