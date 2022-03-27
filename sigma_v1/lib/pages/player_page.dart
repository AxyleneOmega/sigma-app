import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(10, 20, 30, 1),
              Color.fromRGBO(36, 50, 66, 1),
              Color.fromRGBO(10, 20, 30, 1)
            ])),
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text('Player',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ))),
          ),
          body: const Text("Player Page"),
          backgroundColor: MaterialColor(0x243242, sigmaNight),
        ),
      );
}
