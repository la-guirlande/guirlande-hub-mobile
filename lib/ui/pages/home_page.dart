import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/ui/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        elevation: 1,
        title: const Text("Accueil"),
      ),
      body: const HomeBody(),
    );
  }
}
