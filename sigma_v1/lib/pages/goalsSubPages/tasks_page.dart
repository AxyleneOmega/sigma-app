import 'package:flutter/material.dart';
import 'package:sigma_v1/pages/player_page.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, this.index = 0, this.child}) : super(key: key);
  final int index;
  final Widget? child;
  @override
  State<TaskPage> createState() => _TaskPage();
}

class _TaskPage extends State<TaskPage> {
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
                    child: Text("Tasks",
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
                    color: const Color.fromRGBO(252, 221, 236, 1),
                    width: 3.5,
                  ),
                ),
                child: const RawScrollbar(
                  crossAxisMargin: -5,
                  thumbColor: Color.fromRGBO(129, 125, 234, 1),
                  thickness: 6,
                  radius: Radius.circular(10),
                  minThumbLength: 10.0,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      TaskList(),
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

Map<int, Task> _taskMap = {
  0: const Task(),
  1: const Task(),
  2: const Task(),
  3: const Task(),
};

class Server {
  static List<Task> getTaskList() => _taskMap.values.toList();
  static Task getTaskByIndex(int id) {
    assert(id >= 0 && id <= 3);
    return _taskMap[id]!;
  }
}

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        final Task task = Server.getTaskByIndex(index);
        return task;
      },
      childCount: 4,
    ));
  }
}

// ignore: must_be_immutable
class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);
  @override
  State<Task> createState() => _Task();
}

class _Task extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(10, 20, 30, 1),
        border: Border.all(
          color: const Color.fromRGBO(129, 125, 234, .6),
          width: 3.5,
        ),
      ),
    );
  }
}
