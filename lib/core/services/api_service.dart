import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:giurlande_hub_mobile/core/config/config.dart';
import 'package:giurlande_hub_mobile/core/models/login/login_request_model.dart';
import 'package:giurlande_hub_mobile/core/models/login/login_response_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  static var storage = FlutterSecureStorage();

  static Future<String> login(LoginRequestModel loginRequestModel) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.refreshTokenAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(loginRequestModel.toJson()));

    if (response.statusCode == 200) {
    LoginResponseModel responseJson = loginResponseModel(response.body);
      storage.write(key: 'accessToken', value:responseJson.accessToken );
      storage.write(key: 'refreshToken', value:responseJson.refreshToken );
      return responseJson.accessToken;
    } else {
      return "Erreur login bg";
    }
  }

  // static Future<String> getUserInfo(LoginRequestModel loginRequestModel) async {
  //   Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

  //   var url = Uri.http(Config.apiUrl, Config.refreshTokenAPI);
  //   var response = await client.post(url,
  //       headers: requestHeaders, body: jsonEncode(loginRequestModel.toJson()));

  //   if (response.statusCode == 200) {
  //     storage.write(key: 'accessToken', value: response.body);
  //   } else {
  //     return "Erreur login bg";
  //   }
  // }
}
