import 'package:flutter/material.dart';

class RoutinesPage extends StatefulWidget {
  const RoutinesPage({Key? key, this.index = 0, this.child}) : super(key: key);
  final int index;
  final Widget? child;
  @override
  State<RoutinesPage> createState() => _RoutinesPage();
}

class _RoutinesPage extends State<RoutinesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            Color.fromRGBO(10, 20, 30, 1),
            Color.fromRGBO(36, 50, 66, 1),
            Color.fromRGBO(10, 20, 30, 1)
          ])),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: Text("Routines",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(10, 20, 30, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(153, 243, 195, 1),
                    width: 3.5,
                  ),
                ),
                child: RawScrollbar(
                  crossAxisMargin: -5,
                  thumbColor: const Color.fromRGBO(129, 125, 234, 1),
                  thickness: 6,
                  radius: const Radius.circular(10),
                  minThumbLength: 10.0,
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: <Widget>[
                      const RoutineList(),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          height:
                              MediaQuery.of(context).size.height * 1.5 * 0.1,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(10, 20, 30, 1),
                              Color.fromRGBO(10, 20, 30, 1)
                            ],
                          )),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 100),
                            child: Icon(
                              Icons.sentiment_very_satisfied,
                              size: 90,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(flex: 1, child: Container()) //null spacer
          ],
        ),
      ),
    );
  }
}

Map<int, Routine> _routineMap = {
  0: const Routine(),
  1: const Routine(),
  2: const Routine(),
  3: const Routine(),
};

class Server {
  static List<Routine> getRoutineList() => _routineMap.values.toList();
  static Routine getRoutineByIndex(int id) {
    assert(id >= 0 && id <= Server.getRoutineList().length);
    return _routineMap[id]!;
  }
}

class RoutineList extends StatelessWidget {
  const RoutineList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        final Routine routine = Server.getRoutineByIndex(index);
        return routine;
      },
      childCount: Server.getRoutineList().length,
    ));
  }
}

// ignore: must_be_immutable
class Routine extends StatefulWidget {
  const Routine({Key? key}) : super(key: key);
  @override
  State<Routine> createState() => _Routine();
}

class _Routine extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        height: MediaQuery.of(context).size.height * 0.14,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(10, 20, 30, 1),
          border: Border.all(
            color: const Color.fromRGBO(153, 243, 195, 1),
            width: 3.5,
          ),
        ),
        child: const Center(
          child: Text("Routine",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900,
              )),
        ));
  }
}
