class BaseModel {
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? status;

  // Map<String, dynamic> toMap() {
  //   return {
  //     'uid': this.uid,
  //     'createdAt': this.createdAt,
  //     'updatedAt': this.updatedAt,
  //     'status': this.status,
  //   };
  // }
  //
  // factory BaseModel.fromMap(Map<String, dynamic> map) {
  //   return BaseModel(
  //     uid: map['uid'] as String,
  //     createdAt: map['createdAt'] as DateTime,
  //     updatedAt: map['updatedAt'] as DateTime,
  //     status: map['status'] as String,
  //   );
  // }
  //
  // BaseModel({
  //   this.uid,
  //   this.createdAt,
  //   this.updatedAt,
  //   this.status,
  // });
}