import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:proj2/Pages/about_diagnozify.dart';
import 'package:proj2/Pages/privacy_policy.dart';
import 'package:proj2/Pages/profile.dart';
import 'package:proj2/news/articleview.dart';
import 'package:proj2/pages/face_scan.dart';
import 'package:proj2/pages/my_doctorslist.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:showcaseview/showcase_widget.dart';
import 'package:proj2/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../sign_in.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);
  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  final myTextsty = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );
  @override
  void initState() {
    super.initState();
    // list of drawer items to display side drawer
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'Diagnozify',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'Home',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'My Profile',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        ProfilePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'Face Scan',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        FaceScan(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'News Feed',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        ArticlePage(
          hasAppbar: false,
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'My Doctors',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        DoctorsPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'About Diagnozify',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        About(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'Privacy Policy',
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        PrivacyPolicy(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextsty,
          name: 'Logout',
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('newLogin', true);
          },
          selectedStyle: myTextsty,
          colorLineSelected: Colors.deepOrange,
        ),
        const SignUp(),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
          builder: (context) => HiddenDrawerMenu(
                backgroundColorMenu: Colors.orange.shade300,
                screens: _pages,
                initPositionSelected: 0,
                slidePercent: 60,
                contentCornerRadius: 27,
              )),
    );
  }
}
