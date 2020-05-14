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
      appBar: AppBar(
        title: Text('Mnemonic Generator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: widget.myController,
              decoration: new InputDecoration(
                  labelText: 'list to remember',
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  )),
            ),
          ),
          RaisedButton(
            child: Text("generate"),
            onPressed: () {
              setState(() {
                mnemonic =
                    widget.mnemGen.generateMnemonic(widget.myController.text);
              });
            },
          ),
          Text(
            mnemonic,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
