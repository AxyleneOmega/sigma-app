import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromRGBO(36, 50, 66, 1),
              Color.fromRGBO(10, 20, 30, 1)
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
            child: RawScrollbar(
              thumbColor: const Color.fromRGBO(129, 125, 234, 1),
              thickness: 10,
              radius: const Radius.elliptical(4, 10),
              child: SingleChildScrollView(
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
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w900,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  'This app is a productivity tracker, daily task scheduler, and also a place to unwind and have fun, all in one package.',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text: 'How to use this app:',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  '📊 Use PLAYER section to track your progress in various categories & optional tags',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  '📅 Schedule & plan your day using the SCHEDULE section, complete with a calendar & daily routine list',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  '🎯 Add, modify & complete your goals, tasks & routines in the GOALS sections',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  '🎮  Use point accumulated in your profile to play mini-games in the REWARDS section.',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  'All the best on your way to become the best you! ',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text: 'Thank you for using our app.',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text: 'Best wishes, ',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 8, 25.0, 8),
                          child: Text.rich(
                            TextSpan(
                              text: 'The SIGMA team 💖',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: MaterialColor(0x243242, sigmaNight),
        ),
      );
}
