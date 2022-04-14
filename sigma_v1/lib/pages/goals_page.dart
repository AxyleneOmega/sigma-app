import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sigma_v1/pages/goalsSubPages/tasks_page.dart';
import 'package:sigma_v1/pages/goalsSubPages/routines_page.dart';
import 'package:sigma_v1/pages/goalsSubPages/objectives_page.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Goals')),
      ),
      body: CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.85,
            viewportFraction: 0.9,
          ),
          itemCount: 3,
          itemBuilder: (context, i, realIndex) {
            return Subpages.get(i);
          }),
      backgroundColor: MaterialColor(0x243242, sigmaNight),
    );
  }
}

class Subpages {
  static const List<StatefulWidget> _subpages = <StatefulWidget>[
    TaskPage(),
    RoutinesPage(),
    ObjectivesPage(),
  ];
  static StatefulWidget get(int index) {
    return _subpages[index];
  }
}
