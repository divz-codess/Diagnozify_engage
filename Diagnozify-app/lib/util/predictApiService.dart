// ignore_for_file: dead_code_catch_following_catch

import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class PredictApiService {
  uploadImage(file) async {
    final _firebaseStorage = FirebaseStorage.instance;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser!.uid.toString();
      var snapshot =
          await _firebaseStorage.ref().child('images/$uid').putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();

      var imageUrl = downloadUrl;
      return imageUrl;
    } else {
      print('Permission not granted. Try Again with permission access');
      return null;
    }
  }

  Future predict(file) async {
    var res = await uploadImage(file);
    if (res != null) {
      print(
          'image uploaded to firebase storage and now we are sending it to model for predction');
      var response = await getResult(res);
      double diGeorgeSyndrome =
          double.parse(response['data']['DiGeorge_Syndrome']);
      double downSyndrome = double.parse(response['data']['Down_syndrome']);
      double noonanSyndrome = double.parse(response['data']['Noonan_Syndrome']);
      double normalPeople = double.parse(response['data']['Normal_people']);

      double williamBurenSyndrome =
          double.parse(response['data']['William_buren_syndrome']);

      // print(diGeorgeSyndrome.toString() + "diGeorge_Syndrome");
      // print(downSyndrome.toString() + "down_syndrome");
      // print(normalPeople.toString() + "normal_people");
      // print(noonanSyndrome.toString() + "down_syndrome");
      // print(williamBurenSyndrome.toString() + "william_buren_syndrome");

      var syndrome = "";
      if (diGeorgeSyndrome > downSyndrome &&
          diGeorgeSyndrome > normalPeople &&
          diGeorgeSyndrome > noonanSyndrome &&
          diGeorgeSyndrome > williamBurenSyndrome) {
        syndrome = "DiGeorge_Syndrome";
      } else if (downSyndrome > diGeorgeSyndrome &&
          downSyndrome > normalPeople &&
          downSyndrome > noonanSyndrome &&
          downSyndrome > williamBurenSyndrome) {
        syndrome = "Down_syndrome";
      } else if (noonanSyndrome > diGeorgeSyndrome &&
          noonanSyndrome > normalPeople &&
          noonanSyndrome > downSyndrome &&
          noonanSyndrome > williamBurenSyndrome) {
        syndrome = "Noonan_Syndrome";
      } else if (normalPeople > diGeorgeSyndrome &&
          normalPeople > noonanSyndrome &&
          normalPeople > downSyndrome &&
          normalPeople > williamBurenSyndrome) {
        syndrome = "Normal_people";
      } else if (williamBurenSyndrome > diGeorgeSyndrome &&
          williamBurenSyndrome > noonanSyndrome &&
          williamBurenSyndrome > downSyndrome &&
          williamBurenSyndrome > normalPeople) {
        syndrome = "William_buren_syndrome";
      } else {
        syndrome = "Normal";
      }
      // print("final res=>" + syndrome);

      await saveResultsToFirestore(res, syndrome);

      return true;
    } else {
      print("oops ! something went wrong");
      return false;
    }
  }

  Future<Map<String, dynamic>> getResult(imageUrl) async {
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection('api').doc('api').get();

      var apiUrl = await snapshot.data()!['apiUrl'];
      if (apiUrl == null || apiUrl == "") {
        var apiResponse = {
          "success": true,
          "error": null,
          "msg": "Api URL not found !",
          "connected": true,
          "data": null
        };
        return apiResponse;
      }

      var urlString = apiUrl.toString();

      var url = Uri.parse(urlString);

      var body = {"image_url": imageUrl};
      final response = await http.post(url, body: jsonEncode(body), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var apiResponse = {
          "success": true,
          "error": null,
          "msg": jsonResponse['msg'],
          "connected": true,
          "data": jsonResponse['data']
        };
        return apiResponse;
      } else {
        var apiResponse = {
          "success": false,
          "error": "${response.statusCode} received",
          "msg": "Could not fetch , try again later",
          "connected": true,
          "item": null
        };
        return apiResponse;
      }
    } catch (e) {
      var apiResponse = {
        "success": false,
        "error": " ${e.toString()} received",
        "msg": "Could not fetch , try again later",
        "connected": true,
        "item": null
      };
      return apiResponse;
    } on HttpException catch (e) {
      var apiResponse = {
        "success": false,
        "error": e.toString(),
        "msg": e.message.toString(),
        "connected": true,
        "item": null
      };
      return apiResponse;
    } on SocketException catch (e) {
      var apiResponse = {
        "success": false,
        "error": e.toString(),
        "msg": e.message.toString(),
        "connected": false,
        "item": null
      };
      return apiResponse;
    }
  }

  saveResultsToFirestore(imageUrl, syndrome) {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser!.uid.toString();
      print(uid);

      users
          .where('email', isEqualTo: auth.currentUser!.email)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((f) {
          print(f.data());
          users
              .doc(f.id)
              .update({'profile_img': imageUrl, 'syndrome': syndrome});
        });
      });
    } catch (e) {
      print(e);
      print("error in saving to firestore");
    }
  }
}
