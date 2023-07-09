class UserModel {
  String username;
  String email;
  String password;
  String createdAt;

  UserModel({required this.username, required this.email, required this.password, required this.createdAt});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "username": username,
      "email": email,
      "password": password,
      "createdAt": createdAt,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"],
      email: json["email"],
      password: json["password"],
      createdAt:json["createdAt"]
    );
  }
}
