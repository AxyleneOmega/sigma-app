import 'package:flutter/material.dart';
import 'package:sigma_v1/auth/login_page.dart';
import 'package:sigma_v1/auth/auth.dart';
import 'package:sigma_v1/footer/tabbar_material_widget.dart';
import 'package:sigma_v1/main.dart';
import 'package:sigma_v1/pages/about_page.dart';
import 'package:sigma_v1/pages/goals_page.dart';
import 'package:sigma_v1/pages/playerPages/player_page.dart';
import 'package:sigma_v1/pages/rewards_page.dart';
import 'package:sigma_v1/pages/schedule/schedule_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, required this.auth}) : super(key: key);
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => _RootPage();
}

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class _RootPage extends State<RootPage> {
  String title = "SIGMA";
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((user) {
      setState(() {
        _authStatus =
            user == null ? AuthStatus.notLoggedIn : AuthStatus.loggedIn;
      });
    });
  }

  void toggleState() {
    if (_authStatus == AuthStatus.loggedIn) {
      _authStatus = AuthStatus.notLoggedIn;
    }
    if (_authStatus == AuthStatus.notLoggedIn) {
      _authStatus = AuthStatus.loggedIn;
    }
  }

  void loggedIn() {
    setState(() {
      _authStatus = AuthStatus.loggedIn;
    });
  }

  void loggedOut() {
    setState(() {
      _authStatus = AuthStatus.notLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        return LoginPage(
          auth: widget.auth,
          onLogin: loggedIn,
        );
      case AuthStatus.loggedIn:
        return MainPage(
          title: title,
          auth: widget.auth,
          onLogOut: loggedOut,
        );
    }
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    required this.title,
    required this.auth,
    required this.onLogOut,
    Key? key,
  }) : super(key: key);
  final String title;
  final BaseAuth auth;
  final VoidCallback onLogOut;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 4;
  var pages = <Widget>[];
  // ignore: prefer_typing_uninitialized_variables
  var auth;
  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    pages = [
      PlayerPage(
        auth: widget.auth,
        onLogout: widget.onLogOut,
      ),
      const SchedulePage(),
      const GoalsPage(),
      const RewardsPage(),
      const AboutPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        body: pages[index],
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        floatingActionButton: MaterialButton(
            onPressed: () => {
                  setState(() {
                    index = 4;
                  })
                },
            padding: const EdgeInsets.all(8),
            textColor: const Color.fromRGBO(10, 20, 30, 1),
            splashColor: const Color.fromRGBO(10, 20, 30, 0),
            elevation: 8.0,
            child: const CircleAvatar(
              radius: 44.0,
              backgroundImage: AssetImage('assets/sl_night_bg.jpg'),
            )),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
