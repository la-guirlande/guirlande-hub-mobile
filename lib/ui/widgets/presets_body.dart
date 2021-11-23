import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PresetsBody extends StatefulWidget {
  const PresetsBody({Key? key}) : super(key: key);

  @override
  _PresetsBodyState createState() => _PresetsBodyState();
}

class _PresetsBodyState extends State<PresetsBody> {
  final style = const TextStyle(fontSize: 62, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Presets Body Guirlande',
        style: GoogleFonts.nunito(textStyle: style),
      ),
    );
  }
}
