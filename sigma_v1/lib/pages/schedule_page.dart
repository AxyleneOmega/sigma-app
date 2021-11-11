import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
        ),
        body: Text("Schedule Page"),
        backgroundColor: MaterialColor(0x243242, sigma_night),
      );
}
