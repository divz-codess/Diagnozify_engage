import 'package:flutter/material.dart';

class DoctorsPage extends StatefulWidget {
  DoctorsPage({Key? key, this.showAppbar = false}) : super(key: key);
  var showAppbar;
  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  List Doctors = [
    {
      'Image': 'docmale1.jpg',
      'Doctorname': 'Dr. Arthur Konan',
      'Qualification': 'MD (Paediatrics)',
      'YOE': '  5 y.o.e.'
    },
    {
      'Image': 'docfemale.jpg',
      'Doctorname': 'Dr. Kylie McClaire',
      'Qualification': 'MD,Genetics',
      'YOE': '  5 y.o.e.'
    },
    {
      'Image': 'docmale2.jpg',
      'Doctorname': 'Dr. Herbert Boyle',
      'Qualification': 'MD (Medicine)',
      'YOE': '  5 y.o.e.'
    },
    {
      'Image': 'femaledoc3.jpg',
      'Doctorname': 'Dr. Jasmine Singh',
      'Qualification': 'MBBS, MD',
      'YOE': '  4 y.o.e.'
    },
    {
      'Image': 'docmale3.jpg',
      'Doctorname': 'Dr. Tim David',
      'Qualification': 'MD, DM',
      'YOE': '  5 y.o.e.'
    },
    {
      'Image': 'doc2.jpg',
      'Doctorname': 'Dr. Pankaj Chauhan',
      'Qualification': 'MD(Genetics)',
      'YOE': '  7 y.o.e.'
    },
    {
      'Image': 'indiandoc.jpg',
      'Doctorname': 'Dr. Ravi Chauhan',
      'Qualification': 'MD (Pediatrician)',
      'YOE': '  8 y.o.e.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppbar
          ? AppBar(
              title: const Text('Doctor\'s Details'),
            )
          : null,
      backgroundColor: Colors.yellow[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Doctors.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Row(
                        children: [
                          Container(
                            //doctor image in this container
                            height: 80,
                            width: 80,
                            child: Image(
                              image: AssetImage(
                                  'lib/ImagesApp/${Doctors[index]["Image"]}'),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow[300],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Doctors[index]["Doctorname"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                const SizedBox(height: 8),
                                Text(
                                    Doctors[index]["Qualification"] +
                                        Doctors[index]["YOE"],
                                    style: const TextStyle(
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(const Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 40),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "To book an appointment mail us contact@diagnozify.com",
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
