import 'package:flutter/material.dart';
import 'package:proj2/pages/login_page.dart';
import 'package:proj2/pages/sign_in.dart';

class Authorise extends StatefulWidget {
  const Authorise({Key? key}) : super(key: key);

  @override
  State<Authorise> createState() => _AuthoriseState();
}

class _AuthoriseState extends State<Authorise> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const Login();
    } else {
      return const SignUp();
    }
  }
}
