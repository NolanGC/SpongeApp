import 'package:flutter/material.dart';
import 'package:my_app/Screens/mnemonic_builder/mnemonic_builder.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPONGE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sponge'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Mnemonic Generator'),
              onPressed: () {
                navigateToMnemonicBuilder(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future navigateToMnemonicBuilder(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MnemonicBuilder()));
  }
}
