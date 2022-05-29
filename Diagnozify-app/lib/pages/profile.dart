import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var isAccount;
  toogleAccountHealth() {
    setState(() {
      isAccount = !isAccount;
    });
  }

  @override
  void initState() {
    isAccount = true;
    super.initState();
  }

  Widget textfield(
      {@required hintText, @required preLoadedValue, @required trailingIcon}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        initialValue: preLoadedValue.toString(),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: trailingIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(hintText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .where('email',
                  isEqualTo: FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data.docs.isEmpty) {
              return const Text('Something Failed ! Please try again later');
            }

            var data = snapshot.data.docs.first.data();
            // print(data);
            return SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  print('object');
                                  isAccount = !isAccount;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.amber),
                                    color: !isAccount
                                        ? Colors.white
                                        : Colors.amber.shade700,
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(20))),
                                margin: const EdgeInsets.only(
                                    top: 60, left: 0, bottom: 10),
                                child: Text(
                                  'My Account',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: isAccount
                                        ? Colors.white
                                        : Colors.amber.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              textfield(
                                  hintText: 'Username',
                                  trailingIcon:
                                      const Icon(CupertinoIcons.person),
                                  preLoadedValue: data['Username']),
                              textfield(
                                  hintText: 'Email',
                                  trailingIcon: const Icon(CupertinoIcons.mail),
                                  preLoadedValue: data['email']),
                              textfield(
                                  hintText: 'Age',
                                  trailingIcon:
                                      const Icon(CupertinoIcons.calendar),
                                  preLoadedValue: data['Age']),
                              textfield(
                                  hintText: 'Gender',
                                  trailingIcon:
                                      const Icon(CupertinoIcons.arrow_branch),
                                  preLoadedValue: data['Gender']),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomPaint(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      painter: HeaderCurvedContainer(),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.08,
                        child: Center(
                          child: CircleAvatar(
                              radius: 90,
                              backgroundImage: data['profile_img'] == ""
                                  ? const NetworkImage(
                                      'https://images.assetsdelivery.com/compings_v2/belopoppa/belopoppa2003/belopoppa200300002.jpg')
                                  : NetworkImage(data['profile_img'])),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.orangeAccent.shade200;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
