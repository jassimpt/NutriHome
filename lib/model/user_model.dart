class UserModel {
  String? username;
  String? email;
  String? uid;

  UserModel({required this.email, required this.username, required this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"], username: json["username"], uid: json["uid"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "uid": uid,
    };
  }
}
