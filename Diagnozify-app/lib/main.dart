import 'package:flutter/material.dart';
import 'package:proj2/pages/front_page.dart';
import 'package:showcaseview/showcase_widget.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // entry point of the application and initialise firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: ShowCaseWidget(
          builder: Builder(builder: (context) => const FrontPage()),
        ));
  }
}
