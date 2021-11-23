import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/ui/pages/account_page.dart';
import 'package:giurlande_hub_mobile/ui/pages/home_page.dart';
import 'package:giurlande_hub_mobile/ui/pages/presets_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

  //PageList
  static const List<Widget> _pageOptions = <Widget>[
    HomePage(),
    PresetsPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageOptions.elementAt(_currentIndex),
      ),
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
