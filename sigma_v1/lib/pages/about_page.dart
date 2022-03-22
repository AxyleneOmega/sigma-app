import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('About',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ))),
        ),
        body: const Text("About Page"),
        backgroundColor: MaterialColor(0x243242, sigmaNight),
      );
}
