import 'dart:convert';

RegisterResponseModel loginResponseModel(String response) =>
    RegisterResponseModel.fromJson(jsonDecode(response));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.id,
    required this.links,
  });
  late final String id;
  late final List<Links> links;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : null;
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['links'] = links.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Links {
  Links({
    required this.rel,
    required this.action,
    required this.href,
  });
  late final String rel;
  late final String action;
  late final String href;

  Links.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    action = json['action'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rel'] = rel;
    _data['action'] = action;
    _data['href'] = href;
    return _data;
  }
}
