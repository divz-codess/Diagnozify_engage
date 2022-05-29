// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Syndromedetail extends StatefulWidget {
  Syndromedetail(
      {Key? key,
      required this.heading,
      required this.desc,
      required this.bg,
      required this.img})
      : super(key: key);
  String heading;
  String desc;
  Color bg;
  String img;

  @override
  State<Syndromedetail> createState() => _SyndromedetailState();
}

class _SyndromedetailState extends State<Syndromedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Syndromes details'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.bg,
                        borderRadius: BorderRadius.circular(12.0)),
                    height: 60,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        widget.heading,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(0.0)),
                    height: 200,
                    width: 450,
                    child: Center(child: Image(image: AssetImage(widget.img))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            widget.desc,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              height: 1.7,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
