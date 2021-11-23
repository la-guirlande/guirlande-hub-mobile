import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/ui/widgets/home_body.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        elevation: 1,
        title: const Text("Accueil"),
      ),
      body: const HomeBody(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Accueil"),
              selectedColor: Colors.teal),
          SalomonBottomBarItem(
              icon: const Icon(Icons.lightbulb_sharp),
              title: const Text("Presets"),
              selectedColor: Colors.purple),
          SalomonBottomBarItem(
              icon: const Icon(Icons.account_circle),
              title: const Text("Compte"),
              selectedColor: Colors.redAccent[400]),
        ],
      ),
    );
  }
}
