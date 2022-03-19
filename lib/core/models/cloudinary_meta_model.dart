class CloudinaryAudioMeta {
  String? bit_rate;
  String? channel_layout;
  int? channels;
  String? codec;
  int? frequency;

  CloudinaryAudioMeta({
    this.bit_rate,
    this.channel_layout,
    this.channels,
    this.codec,
    this.frequency,
  });

  Map<String, dynamic> toMap() {
    return {
      'bit_rate': this.bit_rate,
      'channel_layout': this.channel_layout,
      'channels': this.channels,
      'codec': this.codec,
      'frequency': this.frequency,
    };
  }

  factory CloudinaryAudioMeta.fromMap(Map<String, dynamic> map) {
    return CloudinaryAudioMeta(
      bit_rate: map['bit_rate'] as String,
      channel_layout: map['channel_layout'] as String,
      channels: map['channels'] as int,
      codec: map['codec'] as String,
      frequency: map['frequency'] as int,
    );
  }
}

class CloudinaryVideoMeta {}