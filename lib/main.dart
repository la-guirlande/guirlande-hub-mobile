import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/ui/pages/login_page.dart';
import 'package:giurlande_hub_mobile/ui/wrapper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String> get getAccessToken async {
    var accessToken = await storage.read(key: "accessToken");
    if (accessToken == null) return "";
    return accessToken;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guirlande Hub Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
        future: getAccessToken,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data != "") {
            var str = snapshot.data;
            if (str != "") {
              return Wrapper();
            } else {
              return LoginPage();
            }
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
