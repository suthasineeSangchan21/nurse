import 'dart:io';
import 'dart:typed_data';
import 'package:nurse_app/helper/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

getImg(BehaviorSubject<Uint8List> getDataImgPathSubject) async {
  await getPatientId().then((value) => {callImg(value, getDataImgPathSubject)});
}

callImg(value, BehaviorSubject<Uint8List> getDataImgPathSubject) async {
  await http.get(
      Uri.parse("https://cvc-api.agsofts.com/api/patients/image/" + value),
      headers: {
        'Authorization': "Bearer " + await getAccessToken()
      }).then((value) => {getDataImgPathSubject.sink.add(value.bodyBytes)});
}

callImgPatien(value, getDataImgPathSubject) async {
  await http.get(
      Uri.parse("https://cvc-api.agsofts.com/api/patients/image/" + value),
      headers: {
        'Authorization': "Bearer " + await getAccessToken()
      }).then((value) => {getDataImgPathSubject.sink.add(value.bodyBytes)});
}

getProfileImg(BehaviorSubject<Uint8List> getDataImgPathSubject) async {
  var response = await http.get(
      Uri.parse("https://cvc-api.agsofts.com/api/users/profile/get/"),
      headers: {
        'Authorization': "Bearer " + await getAccessToken()
      }).then((value) => {getDataImgPathSubject.sink.add(value.bodyBytes)});
}

getProfileImgById(id, BehaviorSubject<Uint8List> getDataImgPathSubject) async {
  var response = await http.get(
      Uri.parse("https://cvc-api.agsofts.com/api/users/profile/get/" + id),
      headers: {
        'Authorization': "Bearer " + await getAccessToken()
      }).then((value) => {getDataImgPathSubject.sink.add(value.bodyBytes)});
}

getZoneImgById(id, BehaviorSubject<Uint8List> getDataImgPathSubject) async {
  var response = await http.get(
      Uri.parse("https://cvc-api.agsofts.com/api/zone/image/" + id),
      headers: {
        'Authorization': "Bearer " + await getAccessToken()
      }).then((value) => {getDataImgPathSubject.sink.add(value.bodyBytes)});
}

takeScreenshotandShare(screenshotController) async {
  screenshotController.capture().then((image) async {
    final tempFile = File("${(await getTemporaryDirectory()).path}/img");
    final file = await tempFile.writeAsBytes(
      image.buffer.asUint8List(image.offsetInBytes, image.lengthInBytes),
    );
    await Share.shareFiles([tempFile.path], text: 'Great picture');
  }).catchError((onError) {
    print(onError.toString());
  });
}