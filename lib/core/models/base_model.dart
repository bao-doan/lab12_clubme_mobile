class BaseModel {
  String? uid;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;

  BaseModel({
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'status': this.status,
    };
  }

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    return BaseModel(
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as DateTime,
      updatedAt: map['updatedAt'] as DateTime,
      status: map['status'] as String,
    );
  }
}