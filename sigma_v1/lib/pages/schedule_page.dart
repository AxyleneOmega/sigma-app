import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Schedule'),
          ),
        ),
        body: const Text("Schedule Page"),
        backgroundColor: MaterialColor(0x243242, sigmaNight),
      );
}
