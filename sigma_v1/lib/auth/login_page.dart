import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sigma_v1/auth/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.auth, required this.onLogin})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onLogin;

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

enum FormType {
  login,
  signup,
}

class _LoginPage extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userInput = TextEditingController();

  String? _email;
  String? _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save;
      print('Valid. Email: $_email | Password: $_password');
      return true;
    }
    print('Invalid. Email: $_email | Password: $_password');
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userID =
              await widget.auth.signInWithEmailAndPassword(_email!, _password!);
          print('Logged In As: $userID');
        } else {
          String userID = await widget.auth
              .createUserWithEmailAndPassword(_email!, _password!);
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email!, password: _password!);
          print('Signed Up: $userID');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 3),
              backgroundColor: const Color.fromRGBO(129, 125, 234, .8),
              content: Text(
                "Successfully Signed Up As: " + userCredential.user!.email!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 15,
                ),
              )));
        }
        widget.onLogin();
      } on FirebaseAuthException catch (e) {
        String errorMessage = e.message.toString();
        if (e.message.toString() ==
            'There is no user record corresponding to this identifier. The user may have been deleted.') {
          errorMessage = 'Account does not exist, Sign Up instead.';
        }
        if (e.message.toString() ==
            'The email address is already in use by another account.') {
          errorMessage =
              'Account already exists with this email, Login instead.';
        }
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: const Color.fromRGBO(129, 125, 234, .8),
            content: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 15,
              ),
            )));
      }
    }
  }

  void signUpPage() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.signup;
    });
  }

  void loginPage() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

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
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(129, 125, 234, .15),
                        Color.fromRGBO(129, 125, 234, .15)
                      ]),
                  border: Border.all(
                    color: const Color.fromRGBO(129, 125, 234, .6),
                    width: 3.5,
                  ),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: buildInputField(),
                  ),
                ),
              ),
              buildSwitchFormTypeButton()
            ]),
      ),
    );
  }

  List<Widget> buildInputField() {
    return [
      TextFormField(
        //Username or Email
        controller: userInput,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontSize: 20,
        ),
        obscureText: false,
        validator: (value) => value!.isEmpty ? 'Email can\'t be empty' : null,
        onChanged: (value) => _email = value,
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
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return const Color.fromRGBO(129, 125, 234, 1);
              }
              if (states.contains(MaterialState.error)) {
                return const Color.fromRGBO(255, 100, 100, .5);
              }
              return Colors.white;
            }),
            labelText: 'Username or Email',
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(129, 125, 234, 1),
                  fontSize: 15,
                );
              }
              if (states.contains(MaterialState.scrolledUnder)) {
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
        obscureText: true,
        validator: (value) =>
            value!.isEmpty ? 'Password can\'t be empty' : null,
        onChanged: (value) => _password = value,
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
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return const Color.fromRGBO(129, 125, 234, 1);
              }
              if (states.contains(MaterialState.error)) {
                return const Color.fromRGBO(255, 100, 100, .5);
              }
              return Colors.white;
            }),
            labelText: 'Password',
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(129, 125, 234, 1),
                  fontSize: 15,
                );
              }
              if (states.containsAll(MaterialState.values)) {
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
                  color: Color.fromARGB(126, 255, 255, 255),
                  fontSize: 15,
                );
              }
            })),
      ),
      buildValidationButton(),
    ];
  }

  Widget buildValidationButton() {
    String message = 'Login';
    if (_formType == FormType.signup) {
      message = 'Sign Up!';
    }
    if (_formType == FormType.login) {
      message = 'Login';
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: Color.fromRGBO(129, 125, 234, .1))))),
        onPressed: validateAndSubmit,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            message,
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSwitchFormTypeButton() {
    String message = 'Don\'t have an account? Sign Up Here! 📝';
    if (_formType == FormType.signup) {
      message = 'Have an account already? Login Here! 🎇';
    }
    if (_formType == FormType.login) {
      message = 'Don\'t have an account? Sign Up Here! 📝';
    }

    void switchFormType() {
      if (_formType == FormType.signup) {
        loginPage();
      } else if (_formType == FormType.login) {
        signUpPage();
      }
    }

    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(10, 20, 30, 0),
            border: Border.all(
              color: const Color.fromRGBO(129, 125, 234, 0),
              width: 3.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(
                              color: Color.fromRGBO(129, 125, 234, .1))))),
              onPressed: switchFormType,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
