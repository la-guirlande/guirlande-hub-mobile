import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/core/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

class PresetsBody extends StatefulWidget {
  const PresetsBody({Key? key}) : super(key: key);

  @override
  _PresetsBodyState createState() => _PresetsBodyState();
}

class _PresetsBodyState extends State<PresetsBody> {
  final style = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  var onOff = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              var response = await APIService.togglePresets();
              setState(() {
                onOff = response;
              });
            },
            child: const Center(
              heightFactor: 2,
              child: Text(
                "Toggle Presets",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            child: Container(
              height: 40,
              color: onOff ? Colors.green : Colors.red,
              child: Text(onOff ? 'Allumé' : 'Eteint',
                  style: GoogleFonts.nunito(
                      textStyle: style, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
