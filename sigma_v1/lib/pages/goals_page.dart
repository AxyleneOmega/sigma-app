import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Goals')),
        ),
        body: Text("Goals Page"),
        backgroundColor: MaterialColor(0x243242, sigma_night),
      );
}
