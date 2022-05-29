import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorImagePath;
  final String rating;
  final String doctorName;
  final String doctorProfession;

  DoctorCard(
      {required this.doctorImagePath,
      required this.doctorName,
      required this.doctorProfession,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.only(left: 15),
      child: Container(
          height: 20,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              //doctor pic
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  doctorImagePath,
                  height: 60,
                ),
              ),

              //doctor rating
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    rating,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              //doctor name
              Text(
                doctorName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              //doctor title
              Text(
                doctorProfession + ' 5 y.o.e',
              )
            ],
          )),
    );
  }
}
