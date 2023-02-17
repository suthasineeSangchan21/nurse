import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../../../api/base_repository.dart';
import '../../../helper/Image_picker_helper.dart';
import '../../../model/ActivityResponse.dart';
import '../../../model/DefaultTimeLineResponse.dart';
import '../../../model/DrugSentResponse.dart';
import '../../../model/FlipResponse.dart';
import '../../../model/HealthResponse.dart';
import '../../../model/MedicineResponse.dart';
import '../../../model/EatResponse.dart';
import '../../../model/PhlegmResponse.dart';
import '../../../model/PhysicResponse.dart';
import '../../../model/ShowerResponse.dart';
import '../../../model/WipeResponse.dart';
import '../../../model/WoundResponse.dart';
import '../../../model/drugUserResponse.dart';
import '../../../model/imageTimeline.dart';
import '../../../model/patienResponse.dart';
import '../../../model/timelineResponse.dart';
import '../../../povider/register_repository.dart';
import '../../model/MainResponse.dart';
import '../helper/DateHelper.dart';
import '../helper/shared_preferences.dart';
import '../model.dart';

class TimeLineBloc {
  final RegisterRepository _registerRepository =
      RegisterRepository(BaseRepository.instance);
  final BehaviorSubject<Uint8List> _getImgPathSubject =
      BehaviorSubject<Uint8List>();
  BehaviorSubject<Uint8List> get getImgPathSubject => _getImgPathSubject;

  final BehaviorSubject<List<ImageData>> _imageProfilePathSubject =
      BehaviorSubject<List<ImageData>>();
  BehaviorSubject<List<ImageData>> get imageProfilePathSubject =>
      _imageProfilePathSubject;

  final BehaviorSubject<PatientResponse> _getDataPathSubject =
      BehaviorSubject<PatientResponse>();
  BehaviorSubject<PatientResponse> get getDataPathSubject =>
      _getDataPathSubject;
  final BehaviorSubject<bool> _getPathSubject = BehaviorSubject<bool>();
  BehaviorSubject<bool> get getPathSubject => _getPathSubject;

  TextEditingController timeController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  TextEditingController typeFoodController = TextEditingController();
  TextEditingController foodDetailController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerTall = TextEditingController();
  TextEditingController controllerTemp = TextEditingController();
  TextEditingController controllerHearthless1 = TextEditingController();
  TextEditingController controllerHearthless2 = TextEditingController();
  TextEditingController controllerBeat1 = TextEditingController();
  TextEditingController controllerBeat2 = TextEditingController();
  TextEditingController controllerBloodPl1 = TextEditingController();
  TextEditingController controllerBloodPl2 = TextEditingController();
  TextEditingController controllerO2 = TextEditingController();

  TextEditingController skinController = TextEditingController();
  TextEditingController gumController = TextEditingController();
  TextEditingController blushTeethController = TextEditingController();
  TextEditingController bodyOdorController = TextEditingController();
  TextEditingController teethDetailController = TextEditingController();
  TextEditingController bodysmellController = TextEditingController();
  TextEditingController otherShowerController = TextEditingController();
  TextEditingController esstimateController = TextEditingController();
  TextEditingController showerController = TextEditingController();

  TextEditingController mealController = TextEditingController();
  TextEditingController foodTestController = TextEditingController();
  TextEditingController foodPercentController = TextEditingController();
  TextEditingController otherDetailController = TextEditingController();

  TextEditingController woundController = TextEditingController();
  TextEditingController woundAreaController = TextEditingController();
  TextEditingController woundDetailController = TextEditingController();
  TextEditingController woundSizeController = TextEditingController();

  TextEditingController armLeftController = TextEditingController();
  TextEditingController armRightController = TextEditingController();
  TextEditingController legLeftController = TextEditingController();
  TextEditingController legRightController = TextEditingController();
  TextEditingController neckController = TextEditingController();
  TextEditingController backController = TextEditingController();

  TextEditingController therapy1Controller = TextEditingController();
  TextEditingController therapy2Controller = TextEditingController();
  TextEditingController therapy3Controller = TextEditingController();
  TextEditingController therapy4Controller = TextEditingController();

  TextEditingController activityController = TextEditingController();
  TextEditingController level1Controller = TextEditingController();
  TextEditingController level2Controller = TextEditingController();
  TextEditingController level3Controller = TextEditingController();

  TextEditingController phlegmDetailController = TextEditingController();
  TextEditingController phlegmNextController = TextEditingController();

  TextEditingController useMedicineController = TextEditingController();
  TextEditingController drugNameController = TextEditingController();
  TextEditingController drugTypeController = TextEditingController();
  TextEditingController drugHowtoController = TextEditingController();
  List<TextEditingController> drugUseControllerList = [];
  List<TextEditingController> drugOtherControllerList = [];
  TextEditingController drugOtherController = TextEditingController();
  List<ImageData> ImageListData = [];

  clearData() {
    bodysmellController.clear();
    otherShowerController.clear();
    esstimateController.text = "ปกติ";
    gumController.clear();
    showerController.clear();
    blushTeethController.clear();
    skinController.clear();
    teethDetailController.clear();

    mealController.clear();
    foodTestController.clear();
    foodPercentController.clear();
    otherDetailController.clear();

    ImageListData = [];

    woundController.clear();
    woundAreaController.clear();
    woundDetailController.clear();
    woundSizeController.clear();
    checkBoxData = [false, false, false, false];

    controllerWeight.clear();
    controllerTall.clear();
    controllerTemp.clear();
    controllerHearthless1.clear();
    controllerHearthless2.clear();
    controllerBeat1.clear();
    controllerBeat2.clear();
    controllerBloodPl1.clear();
    controllerBloodPl2.clear();
    controllerO2.clear();

    armLeftController.clear();
    armRightController.clear();
    legLeftController.clear();
    legRightController.clear();
    neckController.clear();
    backController.clear();

    therapy1Controller.clear();
    therapy2Controller.clear();
    therapy3Controller.clear();
    therapy4Controller.clear();
    checkBoxTherapyData = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];

    activityController.clear();
    level1Controller.clear();
    level2Controller.clear();
    level3Controller.clear();

    phlegmDetailController.clear();
    phlegmNextController.clear();
  }

  List<graphData> dataGraph = [];
  List<graphData> dataGraph3 = [];

  int indexGraph = -1;
  List<bool> dataGraphStatus = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  String medicineId = "";
  bool isGraph1 = false;
  bool isGraph2 = false;
  bool isCart = false;
  bool isEdit = false;
  bool isNew = false;
  bool isGetDrug = false;
  List<Graph> graphTemp = [];
  List<Map> products = [];
  static const time = <String>["เช้า", "กลางวัน", "เย็น"];
  static const flavor = <String>["ดี", "ไม่ดี"];
  static const smell = <String>["มี", "ไม่มี"];
  static const oval = <String>["ปกติ", "เหงือกบวม"];
  static const percen = <String>["25%", "50%", "75%", "100%"];
  static const estimate = <String>["ปกติ", "เฝ้าระวัง", "น่าเป็นห่วง"];
  bool isSaveForm = false;
  bool isEditForm = false;
  String userId = "";
  String idForm = "";
  List<dropdownData> dataFoodDropdown = [];
  List<dropdownData> dataEatDropdown = [];
  List<dropdownData> dataPainDropdown = [];
  List<dropdownData> dataWoundDropdown = [];
  List<dropdownData> dataHobbyDropdown = [];
  List<dropdownData> dataTeethDropdown = [];
  List<dropdownData> dataTeethDetailDropdown = [];
  List<dropdownData> dataSkinDropdown = [];
  List<dropdownData> dataShowerDropdown = [];
  List<dropdownData> dataPhlegmDropdown = [];
  List<String> dataPhlegm = ["ทางปาก", "ทางหลอดทางเดินหายใจเทียม"];
  List<String> dataWound = ["แขน", "ขา", "หลัง", "ก้น", "หน้าอก", "ท้อง"];
  List<String> dataHobby = [
    "เลี้ยงปลา",
    "ตัดกระดาษ",
    "อ่านหนังสือ",
    "ปลูกต้นไม้"
  ];
  List<String> dataAtivityGraphTxt = [
    "อาบน้ำ",
    "ทานอาหาร",
    "ตรวจสุขภาพ",
    "พลิกตัว",
    "ทำกายภาพ",
    "ทำกิจกรรม",
    "ทำแผล",
    "เช็ดตัว",
    "ดูดเสมหะ"
  ];
  List<dropdownData> dataAtivityGraph = [];
  List<dropdownData> dataSettingGraph = [];
  List<dropdownData> dataDateGraph = [];
  List<bool> checkBoxData = [false, false, false, false];
  List<String> checkBoxDataName = ["แผลลึก", "แผลเข้าเนื้อ", "แผลฟกช้ำ"];
  List<bool> checkBoxTherapyData = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> checkBoxTherapyDataName = [
    "ซ้าย",
    "ขวา",
    "ซ้าย",
    "ขวา",
    "ซ้าย",
    "ขวา",
    "ซ้าย",
    "ขวา",
    "ซ้าย",
    "ขวา"
  ];
  List<String> teethDataName = ["แปรงเอง", "มีคนแปรงให้", "บ้วนปาก"];
  List<String> skinDataName = ["ชุ่มชื้น", "แห้ง", "แห้งมาก"];
  List<String> showerDataName = ["เช็ดตัว", "อาบเอง", "มีคนอาบให้"];
  List<String> teethDetailDataName = [
    "ฟันแข็งแรง",
    "เลือดออกตามไรฟัน",
    "ปวดฟัน"
  ];

  List<String> settingDataName = [
    "สร้างไทม์ไลน์เพิ่ม",
    "แก้ไขไทม์ไลน์นี้",
    "เลือกไทม์ไลน์"
  ];

  List<String> foodHeaderDataName = [
    "วันที่",
    "มื้ออาหาร",
    "การทาน",
    "รับรสชาติ",
    "ประเมิน"
  ];

  List<String> medicineHeaderDataName = ["วันที่", "ประเภท", "ประเมิน"];
  List<String> showerHeaderDataName = [
    "วันที่",
    "การอาบน้ำ",
    "กลิ่นตัว",
    "ประเมิน"
  ];
  List<String> wipeHeaderDataName = ["วันที่", "บันทึก", "ใช้เวลา", "ประเมิน"];
  List<String> flipHeaderDataName = ["วันที่", "เวลา", "บันทึก", "ประเมิน"];
  List<String> woundHeaderDataName = [
    "วันที่",
    "บริเวณ",
    "ลักษณะแผล",
    "ประเมิน"
  ];
  List<String> healthHeaderDataName = ["วันที่", "เวลา", "เรื่อง", "ประเมิน"];
  List<String> therapyHeaderDataName = [
    "วันที่",
    "บริเวณ",
    "ความอ่อนแรง",
    "ประเมิน"
  ];
  List<String> activityHeaderDataName = [
    "วันที่",
    "กิจกรรม",
    "บันทึก",
    "ประเมิน"
  ];
  List<String> aspirateHeaderDataName = [
    "วันที่",
    "เวลา",
    "ลักษณะการดูดเสมหะ",
    "ประเมิน"
  ];
  chooseTimeLine(TimelineResponse response) {
    dataGraph3[0].name.text = response.activity1!;
    dataGraph3[1].name.text = response.activity2!;
    dataGraph3[2].name.text = response.activity3!;
    dataGraph3[3].name.text = response.activity4!;
    dataGraph3[4].name.text = response.activity5!;
    dataGraph3[5].name.text = response.activity6!;
    dataGraph3[6].name.text = response.activity7!;
    dataGraph3[7].name.text = response.activity8!;
    dataGraph3[8].name.text = response.activity9!;
    dataGraph3[9].name.text = response.activity10!;
    dataGraph3[10].name.text = response.activity11!;

    dataGraph3[0].time.text = response.activity1Time!;
    dataGraph3[1].time.text = response.activity2Time!;
    dataGraph3[2].time.text = response.activity3Time!;
    dataGraph3[3].time.text = response.activity4Time!;
    dataGraph3[4].time.text = response.activity5Time!;
    dataGraph3[5].time.text = response.activity6Time!;
    dataGraph3[6].time.text = response.activity7Time!;
    dataGraph3[7].time.text = response.activity8Time!;
    dataGraph3[8].time.text = response.activity9Time!;
    dataGraph3[9].time.text = response.activity10Time!;
    dataGraph3[10].time.text = response.activity11Time!;

    dataGraph3[0].id = response.activity1Id.toString();
    dataGraph3[1].id = response.activity2Id.toString();
    dataGraph3[2].id = response.activity3Id.toString();
    dataGraph3[3].id = response.activity4Id.toString();
    dataGraph3[4].id = response.activity5Id.toString();
    dataGraph3[5].id = response.activity6Id.toString();
    dataGraph3[6].id = response.activity7Id.toString();
    dataGraph3[7].id = response.activity8Id.toString();
    dataGraph3[8].id = response.activity9Id.toString();
    dataGraph3[9].id = response.activity10Id.toString();
    dataGraph3[10].id = response.activity11Id.toString();

    // dataGraph3[0].idMedicine = response.id.toString();
    // dataGraph3[1].idMedicine = response.id.toString();
    // dataGraph3[2].idMedicine = response.id.toString();
    // dataGraph3[3].idMedicine = response.id.toString();
    // dataGraph3[4].idMedicine = response.id.toString();
    // dataGraph3[5].idMedicine = response.activity6Id.toString();
    // dataGraph3[6].idMedicine = response.activity7Id.toString();
    // dataGraph3[7].idMedicine = response.activity8Id.toString();
    // dataGraph3[8].idMedicine = response.activity9Id.toString();
    // dataGraph3[9].idMedicine = response.activity10Id.toString();
    // dataGraph3[10].idMedicine = response.activity11Id.toString();
    _getPathSubject.sink.add(true);
  }

  late List<Uint8List>? profileImageFile = null;
  int state = 0;
  setData() {
    dataAtivityGraphTxt.forEach((element) {
      var data = dropdownData();
      data.name = element;
      dataAtivityGraph.add(data);
    });
    var data = dropdownData();
    data.name = "อาหารปกติ";
    dataFoodDropdown.add(data);
    var data2 = dropdownData();
    data2.name = "อาหารปั่น";
    dataFoodDropdown.add(data2);

    var eat1 = dropdownData();
    eat1.name = "Feed";
    dataEatDropdown.add(eat1);
    var eat2 = dropdownData();
    eat2.name = "ป้อน";
    dataEatDropdown.add(eat2);
    var eat3 = dropdownData();
    eat3.name = "ทานเอง";
    dataEatDropdown.add(eat3);

    var pain1 = dropdownData();
    pain1.name = "แผลลึก";
    dataPainDropdown.add(pain1);
    var pain2 = dropdownData();
    pain2.name = "แผลเข้าเนื้อ";
    dataPainDropdown.add(pain2);
    var pain3 = dropdownData();
    pain3.name = "แผลฟกช้ำ";
    dataPainDropdown.add(pain3);

    dataWound.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataWoundDropdown.add(wound);
    });

    dataHobby.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataHobbyDropdown.add(wound);
    });

    settingDataName.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataSettingGraph.add(wound);
    });

    dataPhlegm.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataPhlegmDropdown.add(wound);
    });

    for (int i = 0; i <= 11; i++) {
      var value = graphData();
      value.time.text = "00:00";
      dataGraph.add(value);
      dataGraph3.add(value);
    }

    teethDataName.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataTeethDropdown.add(wound);
    });
    teethDetailDataName.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataTeethDetailDropdown.add(wound);
    });
    skinDataName.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataSkinDropdown.add(wound);
    });
    showerDataName.forEach((element) {
      var wound = dropdownData();
      wound.name = element;
      dataShowerDropdown.add(wound);
    });
  }

  newTimeLine() {
    dataGraphStatus = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];

    dataGraph3.clear();
    for (int i = 0; i <= 11; i++) {
      var value = graphData();
      value.time.text = "00:00";
      dataGraph3.add(value);
    }
  }

  int selectTimeLine = 1;
  bool onSelectTimeLine = false;

  check() {
    getGraph().then((value) {
      if (value != "") {
        isGraph1 = true;
      }
    });

    getGraph2().then((value) {
      if (value != "") {
        isGraph2 = true;
      }
    });
  }

  bool checkbox() {
    bool check = false;
    checkBoxData.forEach((element) {
      if (element) {
        check = element;
      }
    });
    return check;
  }

  late DateTime startTime = DateTime.now();
  late DateTime endTime = DateTime.now();

  save() {
    graphTemp.clear();
    dataGraph.forEach((element) {
      var data = Graph();
      data.name = element.name.text;
      data.time = element.time.text == "" ? "00:00" : element.time.text;
      graphTemp.add(data);
    });
  }

  getTime() {
    return DateTime.now();
  }

  fetchUser(id) async {
    var response = await _registerRepository.fetchPatienId(id);
    response.when(success: (PatientResponse data) {
      print(data.toString());
      _getDataPathSubject.sink.add(data);
    }, failure: (message) {
      //   _bloodPathSubject.sink.addError(message);
    }, error: (error) {
      //  _bloodPathSubject.sink.addError(error);
    });
  }

  List<DrugUserResponse> drugUserResponse = [];
  fetchUserDrug(id) async {
    print("fetchUserDrug");
    isGetDrug = true;
    var response = await _registerRepository.fetchUserDrug(userid: id);
    response.when(success: (List<DrugUserResponse> data) {
      print("fetchUserDrug" + data.length.toString());
      drugUseControllerList = [];
      drugOtherControllerList = [];
      drugUserResponse = data;
      print(data.length.toString());
      data.forEach((element1) {
        if (element1.howtoTime == "เช้า") {
          calTime("12:00", element1, "00:00");
        } else if (element1.howtoTime == "กลางวัน") {
          calTime("14:00", element1, "12:00");
        } else if (element1.howtoTime == "เย็น") {
          calTime("18:00", element1, "14:00");
        } else {
          calTime("00:00", element1, "18:00");
        }
        TextEditingController dataController = TextEditingController();
        TextEditingController dataController1 = TextEditingController();
        drugUseControllerList.add(dataController);
        drugOtherControllerList.add(dataController1);
      });
      getDataGraphDefaultSubject.sink.add(defaultTimeLineResponse);
      //dataGraph3[10].time.text = data.!;

      // });
    }, failure: (message) {
      //   _bloodPathSubject.sink.addError(message);
    }, error: (error) {
      //  _bloodPathSubject.sink.addError(error);
    });
  }

  calTime(time, DrugUserResponse element1, time2) {
    int i = 0;
    bool check = false;
    dataGraph3.forEach((element) {
      var date = DateHelper.convertStringToDateTime(time2);
      var date2 = DateHelper.convertStringToDateTime(element.time.text);

      if ((element.name.text == "ทานอาหาร" &&
                  element.time.text != "" &&
                  DateHelper.convertStringToDateTime(element.time.text)
                      .isBefore(DateHelper.convertStringToDateTime(time)) &&
                  DateHelper.convertStringToDateTime(element.time.text)
                      .isAfter(DateHelper.convertStringToDateTime(time2)) ||
              date2.compareTo(date) == 0) &&
          !check) {
        if (element1.howto.toString() == "ก่อนอาหาร" &&
            element1.drugTime != "" &&
            element1.drugTime != null) {
          DateTime time = DateHelper.convertStringToDateTime(element.time.text)
              .add(Duration(
                  days: 0,
                  hours: 0,
                  minutes: -int.parse(element1.drugTime!),
                  seconds: 0));
          if (i == 0) {
            check = true;
            dataGraph3[i].mininame.text = element1.drugName.toString();
            dataGraph3[i].minitype.text = element1.howto.toString();
            dataGraph3[i].minitime.text =
                DateHelper.convertStringCalendarToTimeAndWithFormat(time);
            dataGraph3[i].idMedicine = element1.id.toString();
          } else {
            check = true;
            dataGraph3[i - 1].mininame.text = element1.drugName.toString();
            dataGraph3[i - 1].minitime.text =
                DateHelper.convertStringCalendarToTimeAndWithFormat(time);
            dataGraph3[i - 1].minitype.text = element1.howto.toString();
            dataGraph3[i - 1].idMedicine = element1.id.toString();
          }
        } else if (element1.howto == "หลังอาหาร" &&
            element1.drugTime != "" &&
            element1.drugTime != null) {
          check = true;
          DateTime time = DateHelper.convertStringToDateTime(element.time.text)
              .subtract(Duration(
                  days: 0,
                  hours: 0,
                  minutes: int.parse(element1.drugTime!),
                  seconds: 0));
          element.mininame.text = element1.drugName.toString();
          element.minitime.text =
              DateHelper.convertStringCalendarToTimeAndWithFormat(time);
          element.minitype.text = element1.howto.toString();
          element.idMedicine = element1.id.toString();
        } else {
          if (element1.howto == "ก่อนนอน" &&
              element1.drugTime != "" &&
              element1.drugTime != null) {
            check = true;
            DateTime time =
                DateHelper.convertStringToDateTime(element.time.text).subtract(
                    Duration(
                        days: 0,
                        hours: 0,
                        minutes: int.parse(element1.drugTime!),
                        seconds: 0));
            dataGraph3[10].mininame.text = element1.drugName.toString();
            dataGraph3[10].minitime.text =
                DateHelper.convertStringCalendarToTimeAndWithFormat(time);
            dataGraph3[10].minitype.text = element1.howto.toString();
            dataGraph3[10].idMedicine = element1.id.toString();
          }
        }
      }
      i++;
    });
  }

  var showerData = graphShowerData();
  sendShower() async {
    showerData.bodyOdor = bodysmellController.text;
    showerData.ddate = DateTime.now().toString();
    showerData.detail = otherShowerController.text;
    showerData.estimate = esstimateController.text;
    showerData.gum = gumController.text;
    showerData.howToShower = showerController.text;
    showerData.howToTeeth = blushTeethController.text;
    showerData.skin = skinController.text;
    showerData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));

    showerData.timeEnd = DateHelper.convertTimeFormat(endTime);
    showerData.timeStart = DateHelper.convertTimeFormat(startTime);
    showerData.tooth = teethDetailController.text;
    var response;
    if (isEditForm) {
      print("put");
      response =
          await _registerRepository.putShower(showerData, idForm, userId);
    } else {
      print("post");
      response =
          await _registerRepository.sendShower(showerData, userId, idForm);
    }
    response.when(
        success: (ShowerResponse data) {
          // idForm = data.id.toString();
          getShowerList();
        },
        failure: (message) {
          getShowerList();
        },
        error: (error) {});
  }

  var eatData = graphEatData();
  sendEat() async {
    eatData.canEat = foodPercentController.text;
    eatData.ddate = DateTime.now().toString();
    eatData.detail = otherDetailController.text;
    eatData.estimate = esstimateController.text;
    eatData.foodType = typeFoodController.text;
    eatData.howToEat = foodDetailController.text;
    eatData.meal = mealController.text;
    eatData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));
    eatData.taste = foodTestController.text.toString();
    eatData.timeEnd = DateHelper.convertTimeFormat(endTime);
    eatData.timeStart = DateHelper.convertTimeFormat(startTime);

    ImageListData.forEach((element) {
      if (element.isdel) {
        delFoodImage(element.id);
      }
      if (isEditForm) {
        if (element.isAdd) {
          uploadEat(element.FoodImageFile, idForm);
        }
      }
    });

    var response;
    if (isEditForm) {
      response = await _registerRepository.putEat(eatData, idForm, userId);
    } else {
      response = await _registerRepository.sendEat(eatData, userId, idForm);
    }
    response.when(
        success: (EatResponse data) {
          //   idForm = data.id.toString();
          getFoodList();
          if (!isEditForm) {
            ImageListData.forEach((element) {
              if (element.isAdd) {
                uploadEat(element.FoodImageFile, data.id.toString());
              }
            });
          }
        },
        failure: (message) {
          getFoodList();
        },
        error: (error) {});
  }

  var wipeData = graphWipeData();
  sendWipe() async {
    wipeData.ddate = DateTime.now().toString();
    wipeData.detail = otherDetailController.text;
    wipeData.estimate = esstimateController.text;
    wipeData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));

    wipeData.timeEnd = DateHelper.convertTimeFormat(endTime);
    wipeData.timeStart = DateHelper.convertTimeFormat(startTime);
    wipeData.wound = woundController.text;
    wipeData.woundArea = woundAreaController.text;
    wipeData.woundSize = woundSizeController.text;
    wipeData.woundType = woundDetailController.text;
    ImageListData.forEach((element) {
      if (isEditForm) {
        if (element.isAdd) {
          sendImageWipe(element.FoodImageFile, idForm);
        }
      }
      if (element.isdel) {
        delWipeImage(element.id);
      }
    });
    var response;
    if (isEditForm) {
      response = await _registerRepository.putWipe(wipeData, idForm, userId);
    } else {
      response = await _registerRepository.sendWipe(wipeData, userId, idForm);
    }
    isEditForm = false;
    response.when(
        success: (WipeRwsponse data) {
          print('WipeRwsponse');
          //   idForm = data.id.toString();
          if (!isEditForm) {
            ImageListData.forEach((element) {
              sendImageWipe(element.FoodImageFile, idForm);
            });
          }
          getWipeList();
        },
        failure: (message) {
          getWipeList();
        },
        error: (error) {});
  }

  sendImageWipe(Uint8List file, id) async {
    var response = await _registerRepository.sendWipeImage(file, id);
    response.when(
        success: (PhlegmResponse data) {
          //  idForm = data.id.toString();
          getFlipList();
        },
        failure: (message) {
          getFlipList();
        },
        error: (error) {});
  }

  var flipData = graphFlipData();
  sendFlip() async {
    flipData.ddate = DateTime.now().toString();
    flipData.detail = otherDetailController.text;
    flipData.estimate = esstimateController.text;
    flipData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));

    flipData.timeEnd = DateHelper.convertTimeFormat(endTime);
    flipData.timeStart = DateHelper.convertTimeFormat(startTime);

    var response;
    if (isEditForm) {
      response = await _registerRepository.putFlip(flipData, idForm, userId);
    } else {
      response = await _registerRepository.sendFlip(flipData, userId, idForm);
    }

    response.when(
        success: (FlipResponse data) {
          //idForm = data.id.toString();
          getFlipList();
        },
        failure: (message) {
          getFlipList();
        },
        error: (error) {});
  }

  var woundData = graphWoundData();
  sendWound() async {
    woundData.ddate = DateTime.now().toString();
    woundData.detail = otherDetailController.text;
    woundData.estimate = esstimateController.text;
    woundData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));
    woundData.timeEnd = DateHelper.convertTimeFormat(endTime);
    woundData.timeStart = DateHelper.convertTimeFormat(startTime);
    woundData.area = woundAreaController.text;
    woundData.woundSize = woundSizeController.text;
    woundData.woundType = woundDetailController.text;
    var response;
    if (isEditForm) {
      response = await _registerRepository.putWound(woundData, idForm, userId);
    } else {
      response = await _registerRepository.sendWound(woundData, userId, idForm);
    }

    response.when(
        success: (WoundResponse data) {
          //  idForm = data.id.toString();
          getWoundList();
        },
        failure: (message) {
          getWoundList();
        },
        error: (error) {});
  }

  var healthData = graphHealthData();
  sendHealth() async {
    healthData.ddate = DateTime.now().toString();
    healthData.detail = otherDetailController.text;
    healthData.estimate = esstimateController.text;
    healthData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));

    healthData.timeEnd = DateHelper.convertTimeFormat(endTime);
    healthData.timeStart = DateHelper.convertTimeFormat(startTime);
    healthData.bloodPressure1 = controllerBloodPl1.text;
    healthData.bloodPressure2 = controllerBloodPl2.text;
    healthData.breathe1 = controllerBeat1.text;
    healthData.breathe2 = controllerBeat2.text;
    healthData.co2 = controllerO2.text;
    healthData.hight = controllerTall.text;
    healthData.pulse1 = controllerHearthless1.text;
    healthData.pulse2 = controllerHearthless2.text;
    healthData.temp = controllerTemp.text;
    healthData.weight = controllerWeight.text;

    var response;
    if (isEditForm) {
      response =
          await _registerRepository.putHealth(healthData, idForm, userId);
    } else {
      response =
          await _registerRepository.sendHealth(healthData, userId, idForm);
    }

    response.when(
        success: (HealthResponse data) {
          //  idForm = data.id.toString();
          getHealthList();
        },
        failure: (message) {
          getHealthList();
        },
        error: (error) {});
  }

  var therapyData = graphTherapyData();
  sendPhysical() async {
    therapyData.ddate = DateTime.now().toString();
    therapyData.detail = otherDetailController.text;
    therapyData.estimate = esstimateController.text;
    therapyData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));

    therapyData.timeEnd = DateHelper.convertTimeFormat(endTime);
    therapyData.timeStart = DateHelper.convertTimeFormat(startTime);
    therapyData.armLeft =
        checkBoxTherapyData[0] ? therapy1Controller.text : "-";
    therapyData.armRight =
        checkBoxTherapyData[1] ? therapy1Controller.text : "-";
    therapyData.back = therapy4Controller.text;
    therapyData.legLeft =
        checkBoxTherapyData[2] ? therapy2Controller.text : "-";
    therapyData.legRight =
        checkBoxTherapyData[3] ? therapy2Controller.text : "-";
    therapyData.neck = therapy3Controller.text;

    var response;
    if (isEditForm) {
      response =
          await _registerRepository.putPhysical(therapyData, idForm, userId);
    } else {
      response =
          await _registerRepository.sendPhysical(therapyData, userId, idForm);
    }

    response.when(
        success: (PhysicResponse data) {
          //  idForm = data.id.toString();
          getPhysicalList();
        },
        failure: (message) {
          getPhysicalList();
        },
        error: (error) {});
  }

  var activityData = graphActivityData();
  sendActivity() async {
    activityData.ddate = DateTime.now().toString();
    activityData.detail = otherDetailController.text;
    activityData.estimate = esstimateController.text;
    activityData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));
    activityData.timeEnd = DateHelper.convertTimeFormat(endTime);
    activityData.timeStart = DateHelper.convertTimeFormat(startTime);
    activityData.happy = level2Controller.text;
    activityData.part = level1Controller.text;
    activityData.social = level3Controller.text;
    activityData.activity = activityController.text;
    print("idForm:" + idForm);
    ImageListData.forEach((element) {
      if (element.isdel) {
        delActivityImage(element.id);
      }
      if (isEditForm) {
        if (element.isAdd) {
          uploadActivity(element.FoodImageFile, idForm.toString());
        }
      }
    });
    var response;
    if (isEditForm) {
      response =
          await _registerRepository.putActivity(activityData, idForm, userId);
    } else {
      response =
          await _registerRepository.sendActivity(activityData, userId, idForm);
    }
    response.when(success: (ActivityResponse data) {
      //  idForm = data.id.toString();
      getActivityList();
      ImageListData.forEach((element) {
        if (!isEditForm) {
          if (element.isAdd) {
            uploadActivity(element.FoodImageFile, data.id.toString());
          }
        }
      });
    }, failure: (message) {
      getActivityList();
    }, error: (error) {
      getActivityList();
    });
  }

  var aspirateData = graphAspirateData();
  sendPhlegm() async {
    aspirateData.ddate = DateTime.now().toString();
    aspirateData.detail = otherDetailController.text;
    aspirateData.estimate = esstimateController.text;
    aspirateData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));
    aspirateData.timeEnd = DateHelper.convertTimeFormat(endTime);
    aspirateData.timeStart = DateHelper.convertTimeFormat(startTime);
    aspirateData.howTo = phlegmDetailController.text;
    var response;
    if (isEditForm) {
      response =
          await _registerRepository.putPhlegm(aspirateData, idForm, userId);
    } else {
      response =
          await _registerRepository.sendPhlegm(aspirateData, userId, idForm);
    }
    response.when(
        success: (PhlegmResponse data) {
          //  idForm = data.id.toString();
          getPhlegmList();
        },
        failure: (message) {
          getPhlegmList();
        },
        error: (error) {});
  }

  sendLoopDrug() {
    int i = 0;
    drugUserResponse.forEach((element) {
      if (element.id.toString() == medicineId) {
        sendDrug(i, element);
      }
      i++;
    });
  }

  var drugData = graphDrugData();
  sendDrug(i, DrugUserResponse data) async {
    drugData.ddate = DateTime.now().toString();
    drugData.sumTime = twoDigits(endTime.difference(startTime).inHours) +
        ":" +
        twoDigits(endTime.difference(startTime).inMinutes.remainder(60));
    drugData.timeEnd = DateHelper.convertTimeFormat(endTime);
    drugData.timeStart = DateHelper.convertTimeFormat(startTime);
    drugData.howTo = otherDetailController.text;
    drugData.causeOfUse = drugOtherController.text;
    drugData.drugName = data.drugName!;
    drugData.drugType = data.drugGroup.toString();
    drugData.estimate = esstimateController.text;

    var response;
    if (isEditForm) {
      response = await _registerRepository.putDrug(drugData, idForm, userId);
    } else {
      response =
          await _registerRepository.sendDrug(drugData, idForm, userId, idForm);
    }
    response.when(
        success: (DrugSentResponse data) {
          //  idForm = data.id.toString();
          getDrugList();
        },
        failure: (message) {
          getDrugList();
        },
        error: (error) {});
  }

  getShowerList() async {
    var response = await _registerRepository.getShowerList(userId);
    response.when(
        success: (List<ShowerResponse> data) {
          products = List.generate(data.length, (i) {
            String smell = "";
            if (data[i].bodyOdor.toString() == "false") {
              smell = "ไม่มี";
            } else {
              smell = "มี";
            }
            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2": data[i].howToShower,
              "3": smell,
              "4": data[i].estimate,
              "5": "",
              "ฟัน": data[i].tooth,
              "แปรง": data[i].howToTeeth,
              "ผิว": data[i].skin,
              "เหงือก": data[i].gum,
              "ข้อมูล": data[i].detail,
              "เริ่ม": data[i].timeStart,
              "หลัง": data[i].timeEnd,
              "เวลา": data[i].sumTime,
              "ประเมิณ": data[i].estimate,
            };
          });
        //  _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  final BehaviorSubject<List<Map>> _getDataGraphSubject =
      BehaviorSubject<List<Map>>();
  BehaviorSubject<List<Map>> get getDataGraphSubject => _getDataGraphSubject;

  final BehaviorSubject<ShowerResponse> _getDataShowerSubject =
      BehaviorSubject<ShowerResponse>();
  BehaviorSubject<ShowerResponse> get getDataShowerSubject =>
      _getDataShowerSubject;

  final BehaviorSubject<DefaultTimeLineResponse> _getDataGraphDefaultSubject =
      BehaviorSubject<DefaultTimeLineResponse>();
  BehaviorSubject<DefaultTimeLineResponse> get getDataGraphDefaultSubject =>
      _getDataGraphDefaultSubject;

  final BehaviorSubject<List<TimelineResponse>> _getDataGraphSelectSubject =
      BehaviorSubject<List<TimelineResponse>>();
  BehaviorSubject<List<TimelineResponse>> get getDataGraphSelectSubject =>
      _getDataGraphSelectSubject;

  getFoodList() async {
    var response = await _registerRepository.getEatList(userId);
    response.when(
        success: (List<EatResponse> data) {
          products = List.generate(data.length, (i) {
            String taste = "ไม่ดี";
            if (data[i].taste.toString() == "true") {
              taste = "ดี";
            }

            return {
              "id": data[i].id,
              "#": i + 1,
              "1": data[i].ddate,
              "2": data[i].meal,
              "3": data[i].howToEat,
              "4": taste,
              "5": data[i].estimate,
              "6": data[i].foodtype.toString(),
              "7": data[i].howToEat,
              "8": taste,
              "9": data[i].canEat,
              "10": data[i].timeStart,
              "11": data[i].timeEnd,
              "12": "",
            };
          });
         // _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getFoodImg(id, setState) async {
    ImageListData = [];
    imageProfilePathSubject.sink.add(ImageListData);
    var response = await _registerRepository.getFoodImage(id);
    response.when(
        success: (List<ImageTimeline> data) {
          data.forEach(
            (element) {
              callImFood(element.id.toString(), setState,
                  element.activityEatId.toString());
            },
          );
        },
        failure: (message) async {},
        error: (error) {});
  }

  getWipeImg(id) async {
    ImageListData = [];
    imageProfilePathSubject.sink.add(ImageListData);
    var response = await _registerRepository.getWipeImage(id.toString());
    response.when(
        success: (List<ImageTimeline> data) {
          ImageListData = [];
          imageProfilePathSubject.sink.add(ImageListData!);
          data.forEach(
            (element) {
              callImg(element.id.toString(), element.activityEatId);
            },
          );
        },
        failure: (message) async {},
        error: (error) {});
  }

  getActiviryImg(id) async {
    ImageListData = [];
    imageProfilePathSubject.sink.add(ImageListData);
    var response = await _registerRepository.getActiviryImage(id.toString());
    response.when(
        success: (List<ImageTimeline> data) {
          data.forEach(
            (element) {
              callImgActivity(
                  element.id.toString(), element.activityEatId.toString());
            },
          );
        },
        failure: (message) async {},
        error: (error) {});
  }

  delFoodImage(id) async {
    print("delFoodImage");
    var response = await _registerRepository.deleteFoodImage(id);
    response.when(
        success: (ImageTimeline data) {},
        failure: (message) async {},
        error: (error) {});
  }

  delWipeImage(id) async {
    var response = await _registerRepository.deleteWipeImage(id);
    response.when(
        success: (ImageTimeline data) {},
        failure: (message) async {},
        error: (error) {});
  }

  delActivityImage(id) async {
    var response = await _registerRepository.deleteActivityImage(id);
    response.when(
        success: (ImageTimeline data) {},
        failure: (message) async {},
        error: (error) {});
  }

  final BehaviorSubject<MedicineResponse> _getDataDrugSubject =
      BehaviorSubject<MedicineResponse>();
  BehaviorSubject<MedicineResponse> get getDataDrugSubject =>
      _getDataDrugSubject;
  List<MedicineResponse> dataMedicineResponse = [];
  getDrugList() async {
    dataMedicineResponse = [];
    var response = await _registerRepository.getDrugList(userId);
    response.when(
        success: (List<MedicineResponse> data) {
          dataMedicineResponse = data;
          products = List.generate(data.length, (i) {
            return {
              "id": data[i].id,
              "#": i + 1,
              "1": data[i].ddate,
              "2": data[i].drugType,
              "3": data[i].estimate,
              "4": data[i].howTo,
              "5": data[i].causeOfUse,
              "6": data[i].detail,
              "7": data[i].timeEnd,
            };
          });
          if (data.isNotEmpty) {
            drugNameController.text = data[0].drugName.toString();
            drugTypeController.text = data[0].drugType.toString();
            drugHowtoController.text = data[0].howTo.toString();
          }
        //  _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getWipeList() async {
    var response = await _registerRepository.getWipeList(userId);
    response.when(
        success: (List<WipeRwsponse> data) {
          products = List.generate(data.length, (i) {
            String haveWound = "";
            if (data[i].haveWound == true) {
              haveWound = "มี";
            } else {
              haveWound = "ไม่มี";
            }
            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2": data[i].detail,
              "3": data[i].sumTime,
              "4": data[i].estimate,
              "5": data[i].estimate,
              "6": haveWound,
              "7": data[i].timeStart,
              "8": data[i].timeEnd,
              "9": data[i].woundArea.toString(),
              "10": data[i].woundSize.toString(),
              "11": data[i].woundType.toString(),
            };
          });

         // _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  callImgActivity(id, activityEatId) async {
    ImageData data = ImageData();
    await http.get(
        Uri.parse("https://cvc-api.agsofts.com/api/activity/activity/image/" +
            id.toString()),
        headers: {
          'Authorization': "Bearer " + await getAccessToken()
        }).then((value) => {
          data.FoodImageFile = value.bodyBytes,
          data.id = id.toString(),
          data.ItemId = activityEatId.toString(),
          ImageListData.add(data),
          imageProfilePathSubject.sink.add(ImageListData),
        });
  }

  callImg(id, activityEatId) async {
    ImageData data = ImageData();
    await http.get(
        Uri.parse("https://cvc-api.agsofts.com/api/activity/wipe/image/" +
            id.toString()),
        headers: {
          'Authorization': "Bearer " + await getAccessToken()
        }).then((value) => {
          data.FoodImageFile = value.bodyBytes,
          data.id = id.toString(),
          data.ItemId = activityEatId.toString(),
          ImageListData.add(data),
          imageProfilePathSubject.sink.add(ImageListData),
        });
  }

  callImFood(id, setState, activityEatId) async {
    ImageData data = ImageData();
    http.get(
        Uri.parse("https://cvc-api.agsofts.com/api/activity/eat/image/" +
            id.toString()),
        headers: {
          'Authorization': "Bearer " + await getAccessToken()
        }).then((value) => {
          data.FoodImageFile = value.bodyBytes,
          data.id = id.toString(),
          data.ItemId = activityEatId.toString(),
          ImageListData.add(data),
          imageProfilePathSubject.sink.add(ImageListData),
          setState(() {})
        });
  }

  getFlipList() async {
    var response = await _registerRepository.getFlipList(userId);
    response.when(
        success: (List<FlipResponse> data) {
          products = List.generate(data.length, (i) {
            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2": data[i].timeStart,
              "3": data[i].detail,
              "4": data[i].estimate,
              "5": data[i].sumTime
            };
          });
          //  _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getWoundList() async {
    var response = await _registerRepository.getWoundList(userId);
    response.when(
        success: (List<WoundResponse> data) {
          products = List.generate(data.length, (i) {
            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2": data[i].area,
              "3": data[i].woundType,
              "4": data[i].estimate,
              "5": data[i].area,
              "6": data[i].woundSize,
              "7": data[i].timeStart,
              "8": data[i].timeEnd,
              "9": data[i].detail,
            };
          });
         // _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getHealthList() async {
    var response = await _registerRepository.getHealthList(userId);
    response.when(
        success: (List<HealthResponse> data) {
          products = List.generate(data.length, (i) {
            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2": data[i].timeStart,
              "3": data[i].detail,
              "4": data[i].estimate,
              "5": "",
              "6": data[i].timeEnd,
              "7": data[i].weight,
              "8": data[i].hight,
              "9": data[i].temp,
              "10": data[i].pulse1,
              "11": data[i].breathe1,
              "12": data[i].bloodPressure1,
              "13": data[i].co2,
            };
          });
        //  _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getPhysicalList() async {
    var response = await _registerRepository.getPhysicalList(userId);
    response.when(
        success: (List<PhysicResponse> data) {
          products = List.generate(data.length, (i) {
            String value = data[i].armLeft! +
                " " +
                data[i].armRight! +
                " " +
                data[i].legLeft! +
                " " +
                data[i].legRight!;
            String value1 = "";
            String value2 = "";
            if (data[i].armLeft != "-") {
              value1 = data[i].armLeft!;
            }
            if (data[i].armRight != "-") {
              value1 += data[i].armRight!;
            }
            if (data[i].legLeft != "-") {
              value2 = data[i].legLeft!;
            }
            if (data[i].legRight != "-") {
              value2 += data[i].legRight!;
            }

            String armLeft = "";
            String armLeft2 = "";
            if (data[i].armLeft != "" &&
                data[i].armLeft != null &&
                data[i].armLeft != "-") {
              armLeft = "ซ้าย";
              armLeft2 = "แขนซ้าย";
            }
            String armRight = "";
            String armRight2 = "";
            if (data[i].armRight != "" &&
                data[i].armRight != null &&
                data[i].armRight != "-") {
              armRight = "ขวา";
              armRight2 = "แขนขวา";
            }
            String legLeft = "";
            String legLeft2 = "";
            if (data[i].legLeft != "" &&
                data[i].legLeft != null &&
                data[i].legLeft != "-") {
              legLeft = "ซ้าย";
              legLeft2 = "ขาซ้าย";
            }
            String legRight = "";
            String legRight2 = "";
            if (data[i].legRight != "" &&
                data[i].legRight != null &&
                data[i].legRight != "-") {
              legRight = "ขวา";
              legRight2 = "ขาขวา";
            }

            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2":
                  armLeft2 + " " + armRight2 + " " + legLeft2 + " " + legRight2,
              "3": value1 + " " + value2,
              "4": data[i].estimate,
              "5": data[i].detail,
              "6": armLeft + " " + armRight,
              "7": value1,
              "8": legLeft + " " + legRight,
              "9": value2,
              "10": data[i].neck,
              "11": data[i].back,
              "12": data[i].timeStart,
              "13": data[i].timeEnd,
            };
          });
         // _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getActivityList() async {
    var response = await _registerRepository.getActivityList(userId);
    response.when(
        success: (List<ActivityResponse> data) {
          products = List.generate(data.length, (i) {
            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2": data[i].activity,
              "3": data[i].detail,
              "4": data[i].estimate,
              "5": "",
              "6": data[i].timeStart,
              "7": data[i].timeEnd,
              "8": data[i].part,
              "9": data[i].happy,
              "10": data[i].social,
            };
          });
         // _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getPhlegmList() async {
    var response = await _registerRepository.getPhlegmList(userId);
    response.when(
        success: (List<PhlegmResponse> data) {
          products = List.generate(data.length, (i) {
            return {
              "id": data[i].id,
              "#": i,
              "1": data[i].ddate,
              "2": data[i].timeStart,
              "3": data[i].detail,
              "4": data[i].estimate,
              "5": "",
              "6": data[i].timeEnd,
              "7": data[i].howTo,
            };
          });
        //  _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  String timelineId = "";
  getTimeline() async {
    var response = await _registerRepository.getTimeline(userId);
    response.when(
        success: (List<DefaultTimeLineResponse> data) {
          if (data.isEmpty) {
            getDefaultTimeline();
          } else {
            defaultTimeLineResponse = data[data.length - 1];
            timelineId = data[data.length - 1].id.toString();

            fetchUserDrug(userId);

            getDataGraphDefaultSubject.sink.add(data[data.length - 1]);
          }
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  var timelineData = timelineApiData();
  postTimeline() async {
    timelineData.ddate = DateTime.now().toString();
    timelineData.activity1 = dataGraph3[0].name.text;
    timelineData.activity1_id = dataGraph3[0].id;
    timelineData.activity1Time = dataGraph3[0].time.text;
    timelineData.activity2 = dataGraph3[1].name.text;
    timelineData.activity2_id = dataGraph3[1].id;
    timelineData.activity2Time = dataGraph3[1].time.text;

    timelineData.activity3 = dataGraph3[2].name.text;
    timelineData.activity3_id = dataGraph3[2].id;
    timelineData.activity3Time = dataGraph3[2].time.text;

    timelineData.activity4 = dataGraph3[3].name.text;
    timelineData.activity4_id = dataGraph3[3].id;
    timelineData.activity4Time = dataGraph3[3].time.text;

    timelineData.activity5 = dataGraph3[4].name.text;
    timelineData.activity5_id = dataGraph3[4].id;
    timelineData.activity5Time = dataGraph3[4].time.text;

    timelineData.activity6 = dataGraph3[5].name.text;
    timelineData.activity6_id = dataGraph3[5].id;
    timelineData.activity6Time = dataGraph3[5].time.text;

    timelineData.activity7 = dataGraph3[6].name.text;
    timelineData.activity7_id = dataGraph3[6].id;
    timelineData.activity7Time = dataGraph3[6].time.text;

    timelineData.activity8 = dataGraph3[7].name.text;
    timelineData.activity8_id = dataGraph3[7].id;
    timelineData.activity8Time = dataGraph3[7].time.text;

    timelineData.activity9 = dataGraph3[8].name.text;
    timelineData.activity9_id = dataGraph3[8].id;
    timelineData.activity9Time = dataGraph3[8].time.text;

    timelineData.activity10 = dataGraph3[9].name.text;
    timelineData.activity10_id = dataGraph3[9].id;
    timelineData.activity10Time = dataGraph3[9].time.text;
    timelineData.activity11 = dataGraph3[10].name.text;
    timelineData.activity11_id = dataGraph3[10].id;
    timelineData.activity11Time = dataGraph3[10].time.text;

    // if (isEdit) {
    //   var response =
    //       await _registerRepository.putTimeline(timelineData, timelineId);
    //   response.when(
    //       success: (TimelineResponse data) {
    //         //  _getDataGraphSubject.sink.add(products);
    //       },
    //       failure: (message) {},
    //       error: (error) {
    //         ;
    //       });
    // } else {
    var response = await _registerRepository.postTimeline(timelineData, userId);
    response.when(
        success: (TimelineResponse data) {
          getSelectTimeline();
          //  _getDataGraphSubject.sink.add(products);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
    // }
  }

  String twoDigits(int n) => n.toString().padLeft(2, "0");
  List<String> getHeader(name) {
    switch (name) {
      case "อาบน้ำ":
        {
          return showerHeaderDataName;
        }
      case "ทานอาหาร":
        {
          return foodHeaderDataName;
        }
      case "ตรวจสุขภาพ":
        {
          return healthHeaderDataName;
        }
      case "พลิกตัว":
        {
          return flipHeaderDataName;
        }
      case "ทำกายภาพ":
        {
          return therapyHeaderDataName;
        }
      case "ทำกิจกรรม":
        {
          return activityHeaderDataName;
        }
      case "ทำแผล":
        {
          return woundHeaderDataName;
        }
      case "เช็ดตัว":
        {
          return wipeHeaderDataName;
        }
      case "ดูดเสมหะ":
        {
          return aspirateHeaderDataName;
        }
      case "ให้ยา":
        {
          return medicineHeaderDataName;
        }
      default:
        return medicineHeaderDataName;
    }
  }

  String getIcon(name) {
    switch (name) {
      case "อาบน้ำ":
        {
          return "assets/icon/ic_shower.png";
        }
      case "ทานอาหาร":
        {
          return "assets/icon/restaurant.png";
        }
      case "ตรวจสุขภาพ":
        {
          return 'assets/icon/heart.png';
        }
      case "พลิกตัว":
        {
          return 'assets/icon/sleep.png';
        }
      case "ทำกายภาพ":
        {
          return 'assets/icon/exercise.png';
        }
      case "ทำกิจกรรม":
        {
          return 'assets/icon/hug.png';
        }
      case "ทำแผล":
        {
          return 'assets/icon/medical.png';
        }
      case "เช็ดตัว":
        {
          return 'assets/icon/towel.png';
        }
      case "ดูดเสมหะ":
        {
          return 'assets/icon/fever.png';
        }
      case "ให้ยา":
        {
          return 'assets/images/pills.png';
        }
      default:
        return '';
    }
  }

  openCamera() async {
    var imageByte = await showCamera();
    if (imageByte != null) {
      ImageData data = ImageData();
      data.FoodImageFile = imageByte;
      ImageListData.add(data);
      _imageProfilePathSubject.sink.add(ImageListData!);
    }
  }

  openImagePicker() async {
    var imageByteList = await showImagePicker(1);
    if (imageByteList.isNotEmpty) {
      ImageData data = ImageData();
      data.isAdd = true;
      data.FoodImageFile = imageByteList[0];
      ImageListData.add(data);
      _imageProfilePathSubject.sink.add(ImageListData!);
    }
  }

  openImagePickerPathSubject(PathSubject, Function fn, setState) async {
    var imageByteList = await showImagePicker(1);
    if (imageByteList.isNotEmpty) {
      ImageData data = ImageData();
      data.isAdd = true;
      data.FoodImageFile = imageByteList[0];
      ImageListData.add(data);
      PathSubject.sink.add(ImageListData);
      fn(setState);
    }
  }

  uploadEat(Uint8List file, id) async {
    var response = await _registerRepository.uploadEat(file, id.toString());
    response.when(
        success: (MainResponse data) {},
        failure: (message) {},
        error: (error) {});
  }

  uploadActivity(Uint8List file, id) async {
    var response =
        await _registerRepository.uploadActivity(file, id.toString());
    response.when(
        success: (MainResponse data) {},
        failure: (message) {},
        error: (error) {});
  }

  DefaultTimeLineResponse defaultTimeLineResponse = DefaultTimeLineResponse();
  getDefaultTimeline() async {
    print("getDefaultTimeline");
    var response = await _registerRepository.getDefaultTimeline();
    response.when(
        success: (DefaultTimeLineResponse data) {
          defaultTimeLineResponse = data;
          timelineId = data.id.toString();
          if (!isGetDrug) {
            fetchUserDrug(userId);
          }
          getDataGraphDefaultSubject.sink.add(data);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }

  getSelectTimeline() async {
    var response = await _registerRepository.getSelectTimeline();
    response.when(
        success: (List<TimelineResponse> data) {
          print("userId:" + userId);
          List<TimelineResponse> select = [];
          data.forEach((element) {
            if (element.patientId.toString() == userId) {
              select.add(element);
            }
          });
          _getDataGraphSelectSubject.sink.add(select);
        },
        failure: (message) {},
        error: (error) {
          ;
        });
  }
}