import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final style = const TextStyle(fontSize: 62, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Home Body Guirlande',
        style: GoogleFonts.nunito(textStyle: style),
      ),
    );
  }
}
