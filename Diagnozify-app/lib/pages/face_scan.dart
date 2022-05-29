import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:lottie/lottie.dart';
import 'package:proj2/pages/medCard.dart';
import 'package:proj2/util/predictApiService.dart';

// ignore: must_be_immutable
class FaceScan extends StatefulWidget {
  FaceScan({Key? key, this.showAppbar = false}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var showAppbar;

  @override
  State<FaceScan> createState() => _FaceScanState();
}

class _FaceScanState extends State<FaceScan> {
  File? image;
  var showPredictBtn = false;
  var isLoading = false;
  Future getimage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
        showPredictBtn = true;
      });
    } on PlatformException catch (e) {
      print('Failed to get image $e');
    }
  }

  Future handleResult(context) async {
    // setting loading flag to true when starting prediction
    setState(() {
      isLoading = true;
    });

    try {
      var result = await _predictApiService.predict(image!);
      if (result) {
        // if true result then go to med card and show output

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MedCard()));
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  // save image to local storage and return path
  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }
  
  final PredictApiService _predictApiService = PredictApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.showAppbar
          ? AppBar(
              title: const Text('Face Scan'),
            )
          : null,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            image != null
                ? Image.file(
                    image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 300,
                    width: 300,
                    padding: const EdgeInsets.all(20),
                    color: Colors.deepOrangeAccent[200],
                    child: Lottie.asset('lib/ImagesApp/facescan.json'),
                    //Image(image: AssetImage('lib/ImagesApp/facescan.png')),
                  ),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      CustomButton(
                          icon: Icons.image,
                          onclick: () => getimage(ImageSource.gallery),
                          title: 'Upload from Gallery'),
                      CustomButton(
                          icon: Icons.camera_alt,
                          onclick: () => getimage(ImageSource.camera),
                          title: '    Open Camera'),
                      showPredictBtn
                          ? CustomButton(
                              title: 'Predict Chances',
                              icon: Icons.batch_prediction_outlined,
                              onclick: () => handleResult(context),
                            )
                          : Container(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onclick,
}) {
  return Container(
      width: 250,
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
      child: ElevatedButton(
        onPressed: onclick,
        child: Row(
          children: [
            const SizedBox(
              height: 20,
            ),
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ));
}
