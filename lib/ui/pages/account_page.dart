import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/ui/widgets/account_body.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        elevation: 2,
        title: const Text("Account"),
      ),
      body: const AccountBody(),
    );
  }
}
