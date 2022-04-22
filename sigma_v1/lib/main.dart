import 'package:sigma_v1/footer/tabbar_material_widget.dart';
import 'package:sigma_v1/pages/about_page.dart';
import 'package:sigma_v1/pages/goals_page.dart';
import 'package:sigma_v1/pages/playerPages/player_page.dart';
import 'package:sigma_v1/pages/rewards_page.dart';
import 'package:sigma_v1/pages/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_v1/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Map<int, Color> sigmaPurple = {
  50: const Color.fromRGBO(129, 125, 234, .1),
  100: const Color.fromRGBO(129, 125, 234, .2),
  200: const Color.fromRGBO(129, 125, 234, .3),
  300: const Color.fromRGBO(129, 125, 234, .4),
  400: const Color.fromRGBO(129, 125, 234, .5),
  500: const Color.fromRGBO(129, 125, 234, .6),
  600: const Color.fromRGBO(129, 125, 234, .7),
  700: const Color.fromRGBO(129, 125, 234, .8),
  800: const Color.fromRGBO(129, 125, 234, .9),
  900: const Color.fromRGBO(129, 125, 234, 1),
};

Map<int, Color> sigmaNight = {
  50: const Color.fromRGBO(36, 50, 66, .1),
  100: const Color.fromRGBO(36, 50, 66, .2),
  200: const Color.fromRGBO(36, 50, 66, .3),
  300: const Color.fromRGBO(36, 50, 66, .4),
  400: const Color.fromRGBO(36, 50, 66, .5),
  500: const Color.fromRGBO(36, 50, 66, .6),
  600: const Color.fromRGBO(36, 50, 66, .7),
  700: const Color.fromRGBO(36, 50, 66, .8),
  800: const Color.fromRGBO(36, 50, 66, .9),
  900: const Color.fromRGBO(36, 50, 66, 1),
};

class MyApp extends StatelessWidget {
  final String title = "SIGMA";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          title: title,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat',
            primarySwatch: MaterialColor(0xFF817DEA, sigmaPurple),
            backgroundColor: MaterialColor(0x243242, sigmaNight),
            scaffoldBackgroundColor: MaterialColor(0xFF817DEA, sigmaPurple),
          ),
          home: MainPage(title: title),
        );
      }));
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
  int index = 4;
  final pages = <Widget>[
    const PlayerPage(),
    const SchedulePage(),
    const GoalsPage(),
    const RewardsPage(),
    const AboutPage(),
  ];
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
