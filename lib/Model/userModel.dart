class UserModel {
  String? name;
  String? email;
  String? phone;
  String? password;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.password
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
    );
  }
}
