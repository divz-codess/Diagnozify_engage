import 'package:flutter/material.dart';
import 'package:proj2/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proj2/pages/screens/hidden_drawer.dart';
import 'package:proj2/util/userdetail.dart';
import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final conpassword_controller = TextEditingController();
  final name_controller = TextEditingController();
  final age_controller = TextEditingController();
  final gender_controller = TextEditingController();
  var isLoading;

  Future SignUp() async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email_controller.text.trim(),
        password: password_controller.text.trim(),
      );

      if (name_controller.text.trim().isEmpty ||
          age_controller.text.trim().isEmpty ||
          gender_controller.text.trim().isEmpty) {
        setState(() {
          isLoading = false;
        });
        FancySnackbar.showSnackbar(
          context,
          snackBarType: FancySnackBarType.warning,
          title: "Required",
          message: "All fields are required",
          duration: 5,
          onCloseEvent: () {},
        );
        return;
      }
      await userDetail(name_controller.text.trim(),
          int.parse(age_controller.text.trim()), gender_controller.text.trim());

      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool('newLogin', true);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HiddenDrawer()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      FancySnackbar.showSnackbar(
        context,
        snackBarType: FancySnackBarType.error,
        title: "Oops ! ",
        message: e.message.toString(),
        duration: 5,
        onCloseEvent: () {},
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      FancySnackbar.showSnackbar(
        context,
        snackBarType: FancySnackBarType.error,
        title: "Oops ! ",
        message: 'Something went wrong ! Try again later',
        duration: 5,
        onCloseEvent: () {},
      );
    }
  }

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();
    conpassword_controller.dispose();
    name_controller.dispose();
    age_controller.dispose();
    gender_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                    height: 170,
                    width: 170,
                    child: Image(
                        image: AssetImage('lib/ImagesApp/Diagnozify.png'))),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Hello!!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to D!agnoz!fy !',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: TextField(
                        controller: name_controller,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: TextField(
                        controller: email_controller,
                        decoration: const InputDecoration(
                          hintText: 'Email ID',
                          prefixIcon: Icon(
                            Icons.mail_rounded,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: TextField(
                        controller: age_controller,
                        decoration: const InputDecoration(
                          hintText: 'Age',
                          prefixIcon: Icon(
                            Icons.calendar_today_outlined,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: TextField(
                        controller: gender_controller,
                        decoration: const InputDecoration(
                          hintText: 'Gender',
                          prefixIcon: Icon(
                            Icons.people_alt,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: TextField(
                        controller: password_controller,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                isLoading
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: GestureDetector(
                          onTap: SignUp,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Center(
                                child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            )),
                          ),
                        ),
                      ),
                //not a member and register button added here
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Already a member',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Login()));
                    },
                    child: const Text(
                      '  Login Now!',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
