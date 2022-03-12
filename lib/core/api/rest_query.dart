class RestQuery {
  bool? populate;

  RestQuery({
    populate = true,
  })
  : this.populate = populate
  ;

  Map<String, dynamic> toMap() {
    return {
      'populate': this.populate,
    };
  }

  factory RestQuery.fromMap(Map<String, dynamic> map) {
    return RestQuery(
      populate: map['populate'] as bool,
    );
  }
}