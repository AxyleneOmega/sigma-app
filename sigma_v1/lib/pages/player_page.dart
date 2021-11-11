import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('Player',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ))),
        ),
        body: Text("Player Page"),
        backgroundColor: MaterialColor(0x243242, sigma_night),
      );
}
