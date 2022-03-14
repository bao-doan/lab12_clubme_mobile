
class AuthRequestModel {
  String username;
  String password;

  AuthRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }

  factory AuthRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthRequestModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}