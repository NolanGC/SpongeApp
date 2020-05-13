import 'package:flutter/material.dart';
import 'package:my_app/Screens/mnemonic_builder/mnemonic.dart';

class TextSection extends StatelessWidget {
  final Color _color;

  TextSection(this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color,
      ),
      child: Text(generateText()),
    );
  }

  String generateText() {
    Mnemonic m = new Mnemonic();
    return m.generateMnemonic("my name is nolan wow");
  }
}
