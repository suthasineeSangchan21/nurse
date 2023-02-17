import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import 'model/DutyScheduleResponse.dart';
import 'model/UsersListResponse.dart';

class dropdownData {
  String id = '';
  String name = '';
  String code = '';
}

class graphData {
  TextEditingController time = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController minitime = TextEditingController();
  TextEditingController mininame = TextEditingController();
  TextEditingController minitype = TextEditingController();
  bool isSave = false;
  String icon = '';
  String id = "";
  String idMedicine = "";
}

class graphShowerData {
  String ddate = '';
  String howToShower = '';
  String howToTeeth = '';
  String bodyOdor = '';
  String skin = '';
  String tooth = '';
  String gum = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphEatData {
  String ddate = '';
  String meal = '';
  String foodType = '';
  String howToEat = '';
  String taste = '';
  String canEat = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphWipeData {
  String ddate = '';
  String wound = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
  String woundArea = '';
  String woundType = '';
  String woundSize = '';
}

class graphFlipData {
  String ddate = '';
  String armLeft = '';
  String armRight = '';
  String legLeft = '';
  String legRight = '';
  String neck = '';
  String back = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphWoundData {
  String ddate = '';
  String area = '';
  String woundType = '';
  String woundSize = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphHealthData {
  String ddate = '';
  String weight = '';
  String hight = '';
  String temp = '';
  String pulse1 = '';
  String pulse2 = '';
  String breathe1 = '';
  String breathe2 = '';
  String bloodPressure1 = '';
  String bloodPressure2 = '';
  String co2 = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphTherapyData {
  String ddate = '';
  String armLeft = '';
  String armRight = '';
  String legLeft = '';
  String legRight = '';
  String neck = '';
  String back = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphActivityData {
  String ddate = '';
  String part = '';
  String activity = '';
  String happy = '';
  String social = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphAspirateData {
  String ddate = '';
  String howTo = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class graphDrugData {
  String ddate = '';
  String drugName = '';
  String howTo = '';
  String drugType = '';
  String causeOfUse = '';
  String detail = '';
  String timeStart = '';
  String timeEnd = '';
  String sumTime = '';
  String estimate = '';
}

class timelineApiData {
  String patientId = '';
  String ddate = '';
  String activity1_id = '';
  String activity1 = '';
  String activity1Time = '';
  String activity2_id = '';
  String activity2 = '';
  String activity2Time = '';
  String activity3_id = '';
  String activity3 = '';
  String activity3Time = '';
  String activity4_id = '';
  String activity4 = '';
  String activity4Time = '';
  String activity5_id = '';
  String activity5 = '';
  String activity5Time = '';
  String activity6_id = '';
  String activity6 = '';
  String activity6Time = '';
  String activity7_id = '';
  String activity7 = '';
  String activity7Time = '';
  String activity8_id = '';
  String activity8 = '';
  String activity8Time = '';
  String activity9_id = '';
  String activity9 = '';
  String activity9Time = '';
  String activity10_id = '';
  String activity10 = '';
  String activity10Time = '';
  String activity11_id = '';
  String activity11 = '';
  String activity11Time = '';
}

class ImageData {
  late Uint8List FoodImageFile;
  bool isAdd = false;
  bool isdel = false;
  String id = "";
  String ItemId = "";
}

class Graph {
  String? id;
  String? time;
  String? name;

  Graph({this.id, this.time, this.name});

  Graph.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time'] = this.time;
    data['name'] = this.name;
    return data;
  }
}

class EyeAssessmentData {
  String step = "";
  String StepLeftOrRight = "";
  String StepOption = "";
}

class BodyAssessmentData {
  String id = "";
  String patientId = "";
  String weight = "";
  String height = "";
  String temp = "";
  String pulse1 = "";
  String pulse2 = "";
  String bloodPressure1 = "";
  String bloodPressure2 = "";
  String co2 = "";
  String body1 = "";
  String body1_option = "";
  String body2 = "";
  String body2_option = "";
  String body3 = "";
  String body3_option = "";
  String body4 = "";
  String body4_option = "";
  String body5 = "";
  String body5_option = "";
  String body6 = "";
  String body6_option = "";
  String body7 = "";
  String body7_option = "";
  String body8 = "";
  String body8_option = "";
  String created_at = "";
  String updated_at = "";
}

class patientData {
  String ddate = "";
  String hn = "";
  String title = "";
  String firstName = "";
  String lastName = "";
  String nickName = "";
  String gender = "";
  String idCard = "";
  String birthDate = "";
  String age = "";
  String bloodType = "";
  String address = "";
  String sub_district_id = "";
  String district_id = "";
  String province_id = "";
  String zip = "";
  String country_id = "";
  String phone = "";
  String email = "";
  String rel1FirstName = "";
  String rel1LastName = "";
  String rel1_id = "";
  String rel1Phone = "";
  String rel1Main = "";
  String rel2FirstName = "";
  String rel2LastName = "";
  String rel2_id = "";
  String rel2Phone = "";
  String rel2Main = "";
  String rel3FirstName = "";
  String rel3LastName = "";
  String rel3_id = "";
  String rel3Phone = "";
  String rel3Main = "";
  String rel4FirstName = "";
  String rel4LastName = "";
  String rel4_id = "";
  String rel4Phone = "";
  String welfare = "";
  String hospital1 = "";
  String doctor1 = "";
  String hospital2 = "";
  String doctor2 = "";
}

class timeData {
  TextEditingController time = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController minitime = TextEditingController();
  TextEditingController mininame = TextEditingController();
  bool isMedicine = false;
  String icon = '';
  String id = "";
}

class DutyUser {
  int bedId = 0;
  int userId = 0;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;
  String mondayTimeStart = "";
  String tuesdayTimeStart = "";
  String wednesdayTimeStart = "";
  String thursdayTimeStart = "";
  String fridayTimeStart = "";
  String saturdayTimeStart = "";
  String sundayTimeStart = "";
  String mondayTimeStop = "";
  String tuesdayTimeStop = "";
  String wednesdayTimeStop = "";
  String thursdayTimeStop = "";
  String fridayTimeStop = "";
  String saturdayTimeStop = "";
  String sundayTimeStop = "";
}

class DutyUserAndBedData {
  DutyScheduleResponse schedule = DutyScheduleResponse();
  UserListResponse user = UserListResponse();
}

class ImageZoneData {
  String id = "";
  late Uint8List img;
}

class hobbyData {
  String name = "";
  bool select = false;
}

class ProfileData {
  String patientId = "";
  String status = "";
  String spouseName = "";
  String isChild = "";
  String child = "";
  String education = "";
  String schoolName = "";
  String yearEdu = "";
  String company = "";
  String position = "";
  String startWork = "";
  String endWork = "";
  String hobby = "";
  String exerciseDay = "";
  String eatVeg = "";
  String dringWater = "";
  String isSmoke = "";
  String isDrink = "";
  String religion = "";
  String society = "";
  String todo = "";
}
