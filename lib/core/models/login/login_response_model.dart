import 'dart:convert';

LoginResponseModel loginResponseModel(String response) =>
    LoginResponseModel.fromJson(jsonDecode(response));

class LoginResponseModel {
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });
  late final String accessToken;
  late final String refreshToken;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['refresh_token'] = refreshToken;
    return _data;
  }
}
