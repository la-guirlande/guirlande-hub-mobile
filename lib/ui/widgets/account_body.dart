import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/core/services/api_service.dart';
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            // height: 50,
            // margin: const EdgeInsets.symmetric(horizontal: 60),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50),
            //   color: const Color.fromRGBO(49, 39, 79, 1),
            // ),
            onPressed: () async {
              APIService.disconnect(context);
            },
            child: const Center(
              heightFactor: 2,
              child: Text(
                "Se déconnecter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
          )
        ],
      ),
    );
  }
}
