class UserModel {
  String? username;
  String? email;
  String? uid;
  String? image;

  UserModel(
      {required this.email,
      required this.username,
      required this.uid,
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"],
        username: json["username"],
        uid: json["uid"],
        image: json["image"]);
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "email": email, "uid": uid, "image": image};
  }
}
