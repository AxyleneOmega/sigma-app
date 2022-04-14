import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final pageController = PageController(initialPage: 1);

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Goals')),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {});
        },
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Container(color: Colors.indigo),
          Container(color: Colors.red),
          Container(color: Colors.brown),
        ],
      ),
      backgroundColor: MaterialColor(0x243242, sigmaNight),
    );
  }
}
