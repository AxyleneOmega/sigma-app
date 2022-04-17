import 'package:flutter/material.dart';
import 'package:sigma_v1/pages/playerPages/player_page.dart';
import 'package:sigma_v1/navbar/settings_navbar_widget.dart';

class PlayerSettings extends StatefulWidget {
  const PlayerSettings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerSettings();
}

class _PlayerSettings extends State<PlayerSettings> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _popNavWithResult(context, 'from_back');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _popNavWithResult(context, 'from_appbar');
            },
          ),
          title: const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text('Player Settings',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                )),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(10, 20, 30, 1),
                Color.fromRGBO(36, 50, 66, 1),
                Color.fromRGBO(10, 20, 30, 1)
              ])),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
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
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  //Login auth out here
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width * .25,
                      MediaQuery.of(context).size.width * .1)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(129, 125, 234, 1)),
                  shadowColor: MaterialStateProperty.all(
                    const Color.fromRGBO(129, 125, 234, .5),
                  ),
                ),
                child: const Text('Log Out',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
          ),
        ),
        //bottomNavigationBar: ,
      ),
    );
  }

  void _popNavWithResult(BuildContext context, dynamic success) {
    Navigator.pop(context, success);
  }
}

class SettingsChangeDetector {
  static bool changesNotSaved = false;
  static bool changesSaved = false;

  static void newChanges() {
    changesNotSaved = true;
    changesSaved = false;
  }

  static void discardChanges() {
    changesNotSaved = false;
    changesSaved = false;
  }

  static void applyChanges() {
    changesNotSaved = false;
    changesSaved = true;
  }

  static bool changesMade() {
    //to be implemented
    //checks and returns if any settings were changed by player
    return false;
  }
}
