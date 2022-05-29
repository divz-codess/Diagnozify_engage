import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proj2/pages/my_doctorslist.dart';
import 'package:proj2/pages/syndromes.dart';

class MedCard extends StatelessWidget {
  const MedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Med Card"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Object>(
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
              if (snapshot.data!.docs.isEmpty) {
                return const Text('Something Failed ! Please try again later');
              }

              var data = snapshot.data.docs.first.data();
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 70),
                          decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              border: Border.all(
                                  color: Colors.deepOrangeAccent, width: 10),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14))),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 100, left: 20, right: 20),
                                child: Text(
                                  data['Username'],
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Text(
                                  "(${data['email']})",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent,
                                        border: Border.all(
                                            color: Colors.deepOrangeAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40))),
                                    child: Text(
                                      data['Gender'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        // color: Colors.deepOrangeAccent,
                                        border: Border.all(
                                            color: Colors.deepOrangeAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40))),
                                    child: Text(
                                      '${data['Age']}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  if (data['syndrome'] != "normal")
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 20,
                                          bottom: 20),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          border: Border.all(
                                              color: Colors.blue.shade700,
                                              width: 5)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${data['syndrome']} ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.blue.shade700,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                CupertinoIcons.heart_slash,
                                                color: Colors.blue.shade700,
                                                size: 30,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  if (data['syndrome'] == "none")
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Detect Now'),
                                      ),
                                    ),
                                  if (data['syndrome'] == "normal")
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 40, right: 40),
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 20,
                                          bottom: 20),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          border: Border.all(
                                              color: Colors.green, width: 5)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Normal ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                CupertinoIcons.heart_circle,
                                                color: Colors.green,
                                                size: 30,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.deepOrangeAccent, width: 10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      data['profile_img'].toString()),
                                )),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Syndromemain()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: const Text(
                          'Read More About Syndromes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorsPage(
                                      showAppbar: true,
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width - 50,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: const Text(
                          'Consult Our Doctors',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
