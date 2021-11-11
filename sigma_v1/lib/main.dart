import 'package:sigma_v1/widget/tabbar_material_widget.dart';
import 'package:sigma_v1/pages/about_page.dart';
import 'package:sigma_v1/pages/goals_page.dart';
import 'package:sigma_v1/pages/player_page.dart';
import 'package:sigma_v1/pages/rewards_page.dart';
import 'package:sigma_v1/pages/schedule_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

Map<int, Color> sigma_purple = {
  50: Color.fromRGBO(129, 125, 234, .1),
  100: Color.fromRGBO(129, 125, 234, .2),
  200: Color.fromRGBO(129, 125, 234, .3),
  300: Color.fromRGBO(129, 125, 234, .4),
  400: Color.fromRGBO(129, 125, 234, .5),
  500: Color.fromRGBO(129, 125, 234, .6),
  600: Color.fromRGBO(129, 125, 234, .7),
  700: Color.fromRGBO(129, 125, 234, .8),
  800: Color.fromRGBO(129, 125, 234, .9),
  900: Color.fromRGBO(129, 125, 234, 1),
};

Map<int, Color> sigma_night = {
  50: Color.fromRGBO(36, 50, 66, .1),
  100: Color.fromRGBO(36, 50, 66, .2),
  200: Color.fromRGBO(36, 50, 66, .3),
  300: Color.fromRGBO(36, 50, 66, .4),
  400: Color.fromRGBO(36, 50, 66, .5),
  500: Color.fromRGBO(36, 50, 66, .6),
  600: Color.fromRGBO(36, 50, 66, .7),
  700: Color.fromRGBO(36, 50, 66, .8),
  800: Color.fromRGBO(36, 50, 66, .9),
  900: Color.fromRGBO(36, 50, 66, 1),
};

class MyApp extends StatelessWidget {
  final String title = "SIGMA";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF817DEA, sigma_purple),
          backgroundColor: MaterialColor(0x243242, sigma_night),
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;
  const MainPage({
    required this.title,
    Key? key,
  }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final pages = <Widget>[
    PlayerPage(),
    SchedulePage(),
    GoalsPage(),
    RewardsPage(),
    AboutPage(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        body: pages[index],
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: IconButton(
            icon: Image.asset(
              'assets/sigma_logo.png',
              scale: 1.0,
            ),
            onPressed: () {},
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              backgroundColor:
                  MaterialStateProperty.all(Colors.black54) // <-- Button color
              ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
