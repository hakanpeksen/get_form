class LoginModel {
  String? name;
  String? email;
  int? password;

  LoginModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  LoginModel.fromMap(Map map)
      : name = map['name'],
        email = map['email'],
        password = map['password'];
}
