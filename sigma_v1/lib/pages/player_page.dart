import 'dart:async';

import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  String _dateTimeNow =
      DateFormat('EEEEE - dd, MMMM, yyyy hh:mm:ss').format(DateTime.now());

  @override
  void initState() {
    _dateTimeNow = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _dateTimeNow = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('EEEEE - dd, MMMM, yyyy hh:mm:ss').format(dateTime);
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
                      height: MediaQuery.of(context).size.height * 0.5,
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
                      child: Expanded(
                        flex: 1,
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
                                  color:
                                      const Color.fromRGBO(129, 125, 234, .1),
                                  width: 3.5,
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      //Player Avatar
                                      margin: const EdgeInsets.all(0),
                                      child: const CircleAvatar(
                                        radius: 44.0,
                                        backgroundImage: AssetImage(
                                            'assets/sl_night_bg.jpg'),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 8, 10, 8),
                                      child: Center(
                                        child: Expanded(
                                          flex: 1,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                const Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "Username",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "Today : " + _dateTimeNow,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: const Expanded(
                                      flex: 1,
                                      child: Icon(Icons.settings_outlined,
                                          size: 40.0,
                                          color: Color.fromARGB(
                                              204, 255, 255, 255)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.33,
                              width: MediaQuery.of(context).size.width * 0.9,
                              margin: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromRGBO(10, 20, 30, 1),
                                border: Border.all(
                                  color:
                                      const Color.fromRGBO(129, 125, 234, .1),
                                  width: 3.5,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 4, 8, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          const Color.fromRGBO(10, 20, 30, 1),
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            129, 125, 234, .1),
                                        width: 3.5,
                                      ),
                                    ),
                                    child: Row(),
                                  ),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
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
