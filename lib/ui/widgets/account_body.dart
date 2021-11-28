import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  _AccountBodyState createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  final style = const TextStyle(fontSize: 62, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Account Body Guirlande',
        style: GoogleFonts.nunito(textStyle: style),
      ),
    );
  }
}
