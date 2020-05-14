import 'package:flutter/material.dart';
import 'package:my_app/mnemonic.dart';

class MnemonicBuilder extends StatefulWidget {
  final myController = TextEditingController();
  final mnemGen = Mnemonic();

  @override
  _MnemonicBuilderState createState() => _MnemonicBuilderState();
}

class _MnemonicBuilderState extends State<MnemonicBuilder> {
  String mnemonic = 'placeholder';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Mnemonic Builder')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(controller: widget.myController),
          Text(mnemonic),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                mnemonic =
                    widget.mnemGen.generateMnemonic(widget.myController.text);
              });
            },
          )
        ],
      ),
    );
  }
}
