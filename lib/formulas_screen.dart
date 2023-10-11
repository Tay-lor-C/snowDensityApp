import 'package:flutter/material.dart';

class FormulasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Center(
              child: Image.asset(
                'assets/equations.png',
                width: 600,
                height: 660,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
