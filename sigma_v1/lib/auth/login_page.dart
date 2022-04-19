import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  late String _email;
  late String _password;

  void validateAndSave() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(36, 50, 66, 1),
              Color.fromRGBO(10, 20, 30, 1),
            ])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(size.width * .3,
                          size.width * .2, size.width * .3, 30),
                      child: Material(
                        shape: const CircleBorder(side: BorderSide.none),
                        child: Image.asset(
                          'assets/sl_night_bg.jpg',
                          colorBlendMode: BlendMode.clear,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ))),
              Container(
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(10, 20, 30, 0),
                  border: Border.all(
                    color: const Color.fromRGBO(129, 125, 234, .6),
                    width: 3.5,
                  ),
                ),
                child: Form(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          //Username or Email
                          style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Email can\'t be empty' : null,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(129, 125, 234, 1),
                                  width: 2.0,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.account_circle_sharp,
                                color: Colors.white,
                              ),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused)) {
                                  return const Color.fromRGBO(129, 125, 234, 1);
                                }
                                if (states.contains(MaterialState.error)) {
                                  return const Color.fromRGBO(
                                      255, 100, 100, .5);
                                }
                                return Colors.white;
                              }),
                              labelText: 'Username or Email',
                              labelStyle: MaterialStateTextStyle.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused)) {
                                  return const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(129, 125, 234, 1),
                                    fontSize: 15,
                                  );
                                }
                                if (states
                                    .contains(MaterialState.scrolledUnder)) {
                                  return const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(126, 63, 136, 0),
                                    fontSize: 15,
                                  );
                                }
                                if (states.contains(MaterialState.error)) {
                                  return const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(255, 100, 100, .5),
                                    fontSize: 15,
                                  );
                                } else {
                                  return const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(255, 255, 255, .5),
                                    fontSize: 15,
                                  );
                                }
                              })),
                        ),
                        Container(
                          //Spacer container
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        TextFormField(
                          //Password
                          style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Email can\'t be empty' : null,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(129, 125, 234, 1),
                                  width: 2.0,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.verified_user_sharp,
                                color: Colors.white,
                              ),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused)) {
                                  return const Color.fromRGBO(129, 125, 234, 1);
                                }
                                if (states.contains(MaterialState.error)) {
                                  return const Color.fromRGBO(
                                      255, 100, 100, .5);
                                }
                                return Colors.white;
                              }),
                              labelText: 'Password',
                              labelStyle: MaterialStateTextStyle.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused)) {
                                  return const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(129, 125, 234, 1),
                                    fontSize: 15,
                                  );
                                }
                                if (states.contains(MaterialState.error)) {
                                  return const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(255, 100, 100, .5),
                                    fontSize: 15,
                                  );
                                } else {
                                  return const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(255, 255, 255, .5),
                                    fontSize: 15,
                                  );
                                }
                              })),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                          child: ElevatedButton(
                            onPressed: validateAndSave,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(10, 20, 30, 0),
                    border: Border.all(
                      color: const Color.fromRGBO(129, 125, 234, 0),
                      width: 3.5,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
