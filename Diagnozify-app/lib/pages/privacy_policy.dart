import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyTextPage());
  }
}

class MyTextPage extends StatelessWidget {
  const MyTextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent[200],
                  borderRadius: BorderRadius.circular(12.0)),
              height: 80,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(15.0)),
              height: 450,
              width: double.infinity,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Diagnozify is an initiative for the people and by them. We try to generate the most accuarte results and for that we try to keep our databse updated and we try to gather information from our users as well by monitoring the recorded facial data from them. We try to better ourselves to increase our accuracy as much as possible. To support our initiative we want our users to accept our privacy policy so that we can create a better platform",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orangeAccent[400],
                  borderRadius: BorderRadius.circular(15.0)),
              height: 70,
              width: double.infinity,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      " Thanks Team D!agnoz!fy 😊",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
