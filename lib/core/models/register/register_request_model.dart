class RegisterRequestModel {
  RegisterRequestModel({
    required this.email,
    required this.name,
    required this.password,
  });
  late final String email;
  late final String name;
  late final String password;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['name'] = name;
    _data['password'] = password;
    return _data;
  }
}
