
import 'package:aula01/widgets/bue_button.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: BlueButton(
        "Voltar",
        onPressed: () => _onClickVoltar(context)
         ),
    );
  }

  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, "Tela 2");
  }
}
