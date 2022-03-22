import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Goals')),
        ),
        body: const Text("Goals Page"),
        backgroundColor: MaterialColor(0x243242, sigmaNight),
      );
}
