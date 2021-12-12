import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/core/config/config.dart';
import 'package:giurlande_hub_mobile/core/models/login/login_request_model.dart';
import 'package:giurlande_hub_mobile/core/services/api_service.dart';
import 'package:giurlande_hub_mobile/main.dart';
import 'package:giurlande_hub_mobile/ui/widgets/fade_animation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var email = "";
    var password = "";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/background.png'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/background-2.png'),
                              fit: BoxFit.fill)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Connexion",
                    style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mot de passe",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // height: 50,
                    // margin: const EdgeInsets.symmetric(horizontal: 60),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(50),
                    //   color: const Color.fromRGBO(49, 39, 79, 1),
                    // ),
                    onPressed: () async {
                      var email = emailController.text;
                      var password = passwordController.text;
                      var credentials = LoginRequestModel(email: email, password: password);

                      var result = APIService.login(credentials);
                        displayDialog(context, "Access Token",
                            result);
                      
                    },
                    child: const Center(
                      heightFactor: 2,
                      child: Text(
                        "Se connecter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                      child: Text(
                    "Créer un compte",
                    style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
