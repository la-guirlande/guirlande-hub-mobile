import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/core/config/config.dart';
import 'package:giurlande_hub_mobile/core/models/login/login_request_model.dart';
import 'package:giurlande_hub_mobile/core/models/login/login_response_model.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class APIService {
  static var client = http.Client();

  static Future<String> login(LoginRequestModel loginRequestModel) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.refreshTokenAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(loginRequestModel.toJson()));
    print(response.statusCode);
    if (response.statusCode == 200) {
      LoginResponseModel responseJson = loginResponseModel(response.body);
      storage.write(key: 'accessToken', value: responseJson.accessToken);
      storage.write(key: 'refreshToken', value: responseJson.refreshToken);
      var accessToken = responseJson.accessToken;
      return accessToken;
    } else {
      return "erreur bg";
    }
  }

  static Future<void> disconnect(context) async {
    storage.delete(key: "accessToken");
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  static Future<bool> togglePresets() async {
    var accessToken = await storage.read(key: 'accessToken');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var url = Uri.http(Config.apiUrl, Config.togglePresets);
    var response = await client.post(url, headers: requestHeaders, body: "");

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
