// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';
import 'package:proj2/Pages/profile.dart';
import 'package:proj2/pages/face_scan.dart';
import 'package:proj2/pages/medCard.dart';
import 'package:proj2/pages/my_doctorslist.dart';
import 'package:proj2/pages/syndromes.dart';
import 'package:showcaseview/showcase.dart';
import '../news/articleview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';
import '../util/doctor_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:proj2/news/apicall.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apicall = ApiService();
  get articles => apicall.getArticle();

  // ignore: prefer_typing_uninitialized_variables
  var selectedIndex;

  List<Widget> bottomOptions = [
    const HomePageView(),
    FaceScan(),
    ArticlePage(),
    ProfilePage()
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedIndex = 0;
    });

    // showTour();
  }

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        children: bottomOptions,
        onPageChanged: (page) {
          // setting pageview index to change bottom nav items
          setState(() {
            selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepOrange.shade400,
            gap: 8,
            padding: const EdgeInsets.all(13),
            tabs: [
              GButton(
                onPressed: () {
                  _pageController.jumpToPage(0);
                },
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.camera_alt_rounded,
                text: 'Scan',
                onPressed: () {
                  _pageController.jumpToPage(1);
                },
              ),
              GButton(
                onPressed: () {
                  _pageController.jumpToPage(2);
                },
                icon: Icons.newspaper_outlined,
                text: 'Feed',
              ),
              GButton(
                onPressed: () {
                  _pageController.jumpToPage(3);
                },
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;

  const CustomShowcaseWidget({
    required this.description,
    required this.child,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        showcaseBackgroundColor: Colors.deepOrangeAccent.shade200,
        contentPadding: const EdgeInsets.all(12),
        description: description,
        descTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        overlayColor: Colors.white,
        overlayOpacity: 0.6,
        child: child,
      );
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  final apicall = ApiService();
  get articles => apicall.getArticle();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    showTour();
    super.initState();
  }

  showTour() async {
    final prefs = await SharedPreferences.getInstance();

    bool isNewLogin = await prefs.getBool('newLogin')!;
    if (isNewLogin) {
      CoachMaker(context, nextStep: CoachMakerControl.next, initialList: [
        CoachModel(
          initial: '1',
          title: 'Scan your face and know your health',
          maxWidth: 400,
          subtitle: [
            "You can use your phone's camera to scan your face",
            "You can also upload an image from your gallery and scan it",
          ],
        ),
        CoachModel(
          initial: '2',
          title: 'Syndromes our app diagnoses',
          maxWidth: 400,
          subtitle: [
            "Get to know more about William Buren , Down's, Noonan DiGeorge syndromes",
          ],
        ),
      ]).show();
      await prefs.setBool('newLogin', false);
    } else {
      await prefs.setBool('newLogin', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.orange.shade200,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        const BubbleSpecialOne(
                          text: 'Hi, How Can I Help You ? ',
                          isSender: false,
                          color: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FaceScan(
                                              showAppbar: true,
                                            )));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 7),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Text(
                                  ' Scan Face',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Syndromemain()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 7),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Text(
                                  ' About Syndromes',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MedCard()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 7),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent.shade200,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Text(
                                  ' My Health Card',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ArticlePage(
                                              hasAppbar: true,
                                            )));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 7),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Text(
                                  ' Med News',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 7),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: const Text(
                                ' Daily Exercises',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
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
                                margin: const EdgeInsets.only(top: 7),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Text(
                                  '️My Doctors',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Container(
            height: 60,
            width: 60,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 10)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.message,
                  size: 33,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        StreamBuilder<Object>(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .where('email',
                                    isEqualTo: FirebaseAuth
                                        .instance.currentUser!.email)
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return const Text(
                                  'Hello User',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                );
                              }

                              if (snapshot.data.docs.isEmpty) {
                                return const Text(
                                  'Hello User',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                );
                              }
                              var data = snapshot.data.docs.first.data();

                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Hello ${data["Username"]} 👋 !',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              );
                            }),
                      ],
                    ),
                    //profile
                  ],
                ),
              ),

              CoachPoint(
                initial: '1',
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 0),
                  padding: const EdgeInsets.only(
                      left: 17, right: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.deepOrange.shade300, width: 8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset('lib/ImagesApp/facescan.json',
                              width: MediaQuery.of(context).size.width * 0.30),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: const Text(
                                  'Try our face scan! ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  'Get your face scanned right away!',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FaceScan(showAppbar: true)));
                                  },
                                  child: const Text('Let\'s find out!'))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              CoachPoint(
                initial: '2',
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen, width: 8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset('lib/ImagesApp/detect.json',
                              width: MediaQuery.of(context).size.width * 0.45),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: const Text(
                                  'Syndromes we detect ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  'Check out your symptoms',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Syndromemain()));
                                  },
                                  child: const Text('Read More'))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              CoachPoint(
                initial: '3',
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.shade400, width: 8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset('lib/ImagesApp/cards.json',
                              width: MediaQuery.of(context).size.width * 0.45),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: const Text(
                                  'Your personal health card',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  'Get your health card here',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MedCard()));
                                  },
                                  child: const Text('Show Card'))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              CoachPoint(
                initial: '4',
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 0),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.yellow.shade700, width: 8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset('lib/ImagesApp/newss.json',
                              width: MediaQuery.of(context).size.width * 0.45),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: const Text(
                                  'Med News Feed',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  'Get your daily dose of medical news here',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ArticlePage(hasAppbar: true)));
                                  },
                                  child: const Text('Check it out'))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              // doctors list card on home page
              CoachPoint(
                initial: '5',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Doctor List',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      CustomShowcaseWidget(
                        globalKey: keyThree,
                        description: 'Doctors connected with us',
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              textStyle: const TextStyle(fontSize: 18),
                              primary: Colors.grey[600],
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DoctorsPage(
                                    showAppbar: true,
                                  );
                                },
                              ));
                            },
                            child: const Text('See all')),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                margin: const EdgeInsets.only(top: 0),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    DoctorCard(
                      doctorImagePath: 'lib/ImagesApp/docmale1.jpg',
                      rating: '4.8',
                      doctorName: 'Dr. Arthur Konan',
                      doctorProfession: 'MD (Paediatrics)',
                    ),
                    DoctorCard(
                      doctorImagePath: 'lib/ImagesApp/docfemale.jpg',
                      rating: '4.6',
                      doctorName: 'Dr. Kylie McClaire',
                      doctorProfession: 'MD,Genetics',
                    ),
                    DoctorCard(
                      doctorImagePath: 'lib/ImagesApp/docmale2.jpg',
                      rating: '4.2',
                      doctorName: 'Dr. Herbert Boyle',
                      doctorProfession: 'MD (Medicine)',
                    ),
                    DoctorCard(
                      doctorImagePath: 'lib/ImagesApp/docmale3.jpg',
                      rating: '4.9',
                      doctorName: 'Dr. Tim David',
                      doctorProfession: 'MD, DM',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
