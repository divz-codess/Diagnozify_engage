import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proj2/pages/authorise.dart';
import 'package:proj2/pages/screens/hidden_drawer.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // checking authentication status and showing login or signup page
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HiddenDrawer();
          } else {
            return const Authorise();
          }
        },
      ),
    );
  }
}
