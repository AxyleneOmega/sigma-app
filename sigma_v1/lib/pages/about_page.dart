import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('About',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ))),
        ),
        body: Text("About Page"),
        backgroundColor: MaterialColor(0x243242, sigma_night),
      );
}
