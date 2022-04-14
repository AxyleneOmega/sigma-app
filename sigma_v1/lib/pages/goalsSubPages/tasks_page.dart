import 'package:flutter/material.dart';

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
              ),
            ),
            Flexible(flex: 1, child: Container()) //null spacer
          ],
        ),
      ),
    );
  }
}
