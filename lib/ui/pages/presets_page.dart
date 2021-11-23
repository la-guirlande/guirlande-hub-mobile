import 'package:flutter/material.dart';
import 'package:giurlande_hub_mobile/ui/widgets/presets_body.dart';

class PresetsPage extends StatelessWidget {
  const PresetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        elevation: 1,
        title: const Text("Presets"),
      ),
      body: const PresetsBody(),
    );
  }
}
