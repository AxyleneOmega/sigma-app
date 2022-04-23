import 'dart:async';

import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigma_v1/pages/playerPages/player_settings.dart';
import 'package:sigma_v1/auth/auth.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key, required this.auth, required this.onLogout})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onLogout;
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  String _dateTimeNow =
      DateFormat('EEEEE - dd, MMMM, yyyy hh:mm:ss').format(DateTime.now());
  String username = 'Username';
  // ignore: prefer_typing_uninitialized_variables
  dynamic logOut;
  // ignore: prefer_typing_uninitialized_variables
  var auth;
  @override
  void initState() {
    _dateTimeNow = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    auth = widget.auth;
    super.initState();
    widget.auth.userEmail().then((userEmail) {
      setState(() {
        username = userEmail!;
      });
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _dateTimeNow = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('EEEEE dd, MMMM, yyyy hh:mm:ss').format(dateTime);
  }

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
                      fontWeight: FontWeight.w700,
                    ))),
          ),
          body: RawScrollbar(
            thumbColor: const Color.fromRGBO(129, 125, 234, 1),
            thickness: 8,
            radius: const Radius.circular(1),
            minThumbLength: 10.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.51,
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(10, 20, 30, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(129, 125, 234, .6),
                          width: 3.5,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(10, 20, 30, 1),
                              border: Border.all(
                                color: const Color.fromRGBO(129, 125, 234, .1),
                                width: 3.5,
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                      //Player Avatar
                                      margin: const EdgeInsets.all(0),
                                      child: const CircleAvatar(
                                        radius: 44.0,
                                        backgroundImage: AssetImage(
                                            'assets/sl_night_bg.jpg'),
                                      )),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 8, 10, 8),
                                    child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                username,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Today : " + _dateTimeNow,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    child: IconButton(
                                      icon: const Icon(Icons.settings_outlined,
                                          size: 30.0,
                                          color: Color.fromARGB(
                                              204, 255, 255, 255)),
                                      onPressed: () async {
                                        var navigationResult =
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (content) =>
                                                        PlayerSettings(
                                                          auth: auth,
                                                          onLogout:
                                                              widget.onLogout,
                                                        )));
                                        if (navigationResult ==
                                            'settings_saved') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          129, 125, 234, .8),
                                                  content: Text(
                                                    "Settings Saved",
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  )));
                                        }
                                        if (navigationResult == 'logout') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          129, 125, 234, .8),
                                                  content: Text(
                                                    "Logging out...",
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  )));
                                        }
                                        if (navigationResult !=
                                                'settings_saved' &&
                                            navigationResult != 'logout') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          129, 125, 234, .8),
                                                  content: Text(
                                                    "Settings Unchanged",
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  )));
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.34,
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(10, 20, 30, 1),
                              border: Border.all(
                                color: const Color.fromRGBO(129, 125, 234, .1),
                                width: 3.5,
                              ),
                            ),
                            child: Column(
                              children: const <Widget>[
                                PlayerAttribute(
                                  attributeName: 'Health',
                                  currentLevel: 10,
                                  percentCompletion: 40,
                                  attributeColor:
                                      Color.fromRGBO(80, 185, 128, 1),
                                ),
                                PlayerAttribute(
                                  attributeName: 'Strength',
                                  currentLevel: 11,
                                  percentCompletion: 60,
                                  attributeColor:
                                      Color.fromRGBO(255, 152, 78, 1),
                                ),
                                PlayerAttribute(
                                  attributeName: 'Creativity',
                                  currentLevel: 3,
                                  percentCompletion: 100,
                                  attributeColor:
                                      Color.fromRGBO(241, 120, 182, 1),
                                ),
                                PlayerAttribute(
                                  attributeName: 'Intellect',
                                  currentLevel: 9,
                                  percentCompletion: 80,
                                  attributeColor:
                                      Color.fromRGBO(120, 120, 241, 1),
                                ),
                                PlayerAttribute(
                                  attributeName: 'Altruism',
                                  currentLevel: 7,
                                  percentCompletion: 20,
                                  attributeColor:
                                      Color.fromRGBO(255, 255, 255, 1),
                                ),
                                PlayerAttribute(
                                  attributeName: 'Exploration',
                                  currentLevel: 5,
                                  percentCompletion: 65,
                                  attributeColor:
                                      Color.fromRGBO(255, 228, 133, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.7,
                                MediaQuery.of(context).size.height * 0.1),
                            maximumSize: Size(
                                MediaQuery.of(context).size.width * 0.9,
                                MediaQuery.of(context).size.height * 0.12),
                            primary: const Color.fromRGBO(165, 165, 246, 1),
                            onPrimary: const Color.fromRGBO(129, 125, 234, .8),
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("View All Progression Metrics",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                          ),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Color.fromRGBO(129, 125, 234, .8),
                            content: Text(
                                "Opening All Progression Metrics, Please Wait"),
                          )),
                        )),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: MaterialColor(0x243242, sigmaNight),
        ),
      );
}

class PlayerAttribute extends StatelessWidget {
  const PlayerAttribute({
    Key? key,
    this.attributeColor = Colors.white,
    this.attributeName = "Null",
    this.percentCompletion = 50.0,
    this.currentLevel = 1,
  }) : super(key: key);

  final String attributeName;
  final Color attributeColor;
  final double percentCompletion;
  final int currentLevel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.048,
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(10, 20, 30, 1),
        border: Border.all(
          color: const Color.fromRGBO(129, 125, 234, .1),
          width: 3.5,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(10, 0, 5, 0),
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                attributeName,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.020,
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(10, 20, 30, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: attributeColor,
                    ),
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width *
                        0.60 *
                        percentCompletion *
                        0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width *
                        0.60 *
                        (1 - (percentCompletion * 0.01)),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(3, 0, 10, 0),
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width * 0.13,
              child: Text(
                "LVL " + currentLevel.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Player {
  Player({Key? key, required this.username, required this.points});
  final String username;
  int points;

  var attributes = List.generate(6, (i) => List.filled(2, 0, growable: false),
      growable: false);

  String getUsername() => username;

  void setAttribute(int attrNum, int points) {
    int level = points ~/ 100;
    int percent = points % 100;
    attributes[attrNum][0] = level;
    attributes[attrNum][1] = percent;
  }

  void increaseAttribute(int attrNum, int points) {
    int level = points ~/ 100;
    int percent = points % 100;
    attributes[attrNum][0] += level;
    attributes[attrNum][1] += percent;
  }
}
