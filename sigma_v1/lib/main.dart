import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_v1/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sigma_v1/root_page.dart';
import 'package:sigma_v1/auth/auth.dart';
import 'root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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

Map<int, Color> sigmaWarm = {
  50: const Color.fromRGBO(249, 106, 101, .1),
  100: const Color.fromRGBO(249, 106, 101, .2),
  200: const Color.fromRGBO(249, 106, 101, .3),
  300: const Color.fromRGBO(249, 106, 101, .4),
  400: const Color.fromRGBO(249, 106, 101, .5),
  500: const Color.fromRGBO(249, 106, 101, .6),
  600: const Color.fromRGBO(249, 106, 101, .7),
  700: const Color.fromRGBO(249, 106, 101, .8),
  800: const Color.fromRGBO(249, 106, 101, .9),
  900: const Color.fromRGBO(249, 106, 101, 1),
};

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final RootPage rootPage = RootPage(auth: Auth());

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          initialRoute: '/',
          title: "SIGMA",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat',
            primarySwatch: MaterialColor(0xFF817DEA, sigmaPurple),
            backgroundColor: MaterialColor(0x243242, sigmaNight),
            scaffoldBackgroundColor: MaterialColor(0xFF817DEA, sigmaPurple),
          ),
          home: rootPage,
        );
      }));
}
