import 'package:flutter/material.dart';
import 'package:my_app/Screens/mnemonic_builder/text_section.dart';

class MnemonicBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Mnemonic Builder')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextSection(Colors.white),
          ],
        ));
  }
}
