import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
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
                  "About D!agnoz!fy.",
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
                      "Diagnozify is an initiative to make it easier for the needy to get hands on quality healthcare. By the means of our app we aim to provide a platform where various syndromes can be detected just by a facial scan. This in turn will help millions of people affected by these diseases to directly meet the correct doctor for their particular disease. Diagnozify uses artificial intelligence to interpret the facial information and provide accurate results. ",
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
