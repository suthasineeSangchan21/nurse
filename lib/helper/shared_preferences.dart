import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

const String accessToken = "accessToken";
const String patientId = "patientId";
const String eye = "eye";
const String nutrition = "nutrition";
const String bone = "bone";
const String mouth = "mouth";
const String estimate = "estimate";
const String body = "body";
const String mind = "mind";
const String sad = "sad";
const String adl = "adl";
const String mood = "mood";
const String saveProfile = "saveProfile";
const String graph = "graph";
const String graph2 = "graph2";
const String graphDate = "graphDate";
const String graphDate2 = "graphDate2";

const String graphStateToday = "grapgraphStateTodayh";

const String graphStateList = "graphStateList";

// saveGraphStateList(String data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString(graphStateList, data);
// }

// Future<String> getGraphStateList() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString(graphStateList) ?? "";
// }

// saveGraphStateToday(String data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString(graphStateToday, data);
// }

// Future<String> getGraphStateToday() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString(graphStateToday) ?? "";
// }

saveGraphDate(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(graphDate, data);
}

Future<String> getGraphDate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var dd = prefs.getString(graphDate);
  print(dd);
  return dd ?? "";
}

saveGraphDate2(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(graphDate2, data);
}

Future<String> getGraphDate2() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var dd = prefs.getString(graphDate2);
  print(dd);
  return dd ?? "";
}

saveGraph(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(graph, data);
}

Future<String> getGraph() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var dd = prefs.getString(graph);
  print(dd);
  return dd ?? "";
}

saveGraph2(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(graph2, data);
}

Future<String> getGraph2() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var dd = prefs.getString(graph2);
  print(dd);
  return dd ?? "";
}

saveAccessToken(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(accessToken, data);
}

Future<String> getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(accessToken) ?? "";
}

savePatientId(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(patientId, data);
}

Future<String> getPatientId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //print("patientId:"+prefs.getString(patientId)!);
  return prefs.getString(patientId) ?? "";
}

saveEye(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(eye, data);
}

Future<bool> getEye() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(eye) ?? false;
}

saveEstimate(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(estimate, data);
}

Future<bool> getEstimate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(estimate) ?? false;
}

saveBody(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(body, data);
}

Future<bool> getBody() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return (prefs.getBool(mouth)! &&
          prefs.getBool(nutrition)! &&
          prefs.getBool(eye)! &&
          prefs.getBool(bone)!) ??
      false;
}

Future<int> getBodyCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<bool> data = [];
  data.add(prefs.getBool(mouth)!);
  data.add(prefs.getBool(nutrition)!);
  data.add(prefs.getBool(eye)!);
  data.add(prefs.getBool(bone)!);
  return data.where((element) => element==true).length;
}

Future<int> getMindCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<bool> data = [];
  data.add(prefs.getBool(mind)!);
  data.add(prefs.getBool(sad)!);
  return data.where((element) => element==true).length;
}

saveMind(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(mind, data);
}

Future<bool> getMind() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(mind) ?? false;
}

saveAdl(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(adl, data);
}

Future<bool> getAdl() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(adl) ?? false;
}

saveNutrition(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(nutrition, data);
}

Future<bool> getNutrition() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(nutrition) ?? false;
}

saveMouth(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(mouth, data);
}

Future<bool> getMouth() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(mouth) ?? false;
}

saveBone(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(bone, data);
}

Future<bool> getBone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(bone) ?? false;
}

saveSad(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(sad, data);
}

Future<bool> getSad() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(sad) ?? false;
}

Future<bool> getMood() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(sad)! && prefs.getBool(mind)! ?? false;
}

saveSaveProfile(bool data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(saveProfile, data);
}

Future<bool> getSaveProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(saveProfile) ?? false;
}