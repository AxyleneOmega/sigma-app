import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(36, 50, 66, 1),
              Color.fromRGBO(36, 50, 66, 1),
              Color.fromRGBO(36, 50, 66, 1)
            ])),
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text('About',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ))),
          ),
          body: Container(
            key: key,
            //decoration: BoxDecoration(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Welcome to SIGMA",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'This app is a productivity tracker, ',
                            ),
                            TextSpan(
                              text: 'daily task scheduler, and also a place ',
                            ),
                            TextSpan(
                                text: 'to unwind and have fun, all in one '),
                            TextSpan(text: 'package. '),
                            TextSpan(text: ''),
                            TextSpan(text: 'How to use this app: '),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: MaterialColor(0x243242, sigmaNight),
        ),
      );
}
