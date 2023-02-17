import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../../model/ShowerResponse.dart';
import '../../../model/drugUserResponse.dart';
import '../../../model/patienResponse.dart';
import 'package:http/http.dart' as http;

import '../../../model/timelineResponse.dart';
import '../../helper/getImg.dart';
import '../../theme/color.dart';
import 'package:share_plus/share_plus.dart';

import '../component/imageCircleView.dart';
import '../helper/DateHelper.dart';
import '../model.dart';
import 'RegisterHistoryBloc.dart';
import 'TimeLineBloc.dart';

class TherapyScreen extends StatefulWidget {
  String id;
  TimeLineBloc timeLineBloc;
  TherapyScreen(this.id, this.timeLineBloc);
  @override
  State<TherapyScreen> createState() => _TherapyScreenState();
}

class _TherapyScreenState extends State<TherapyScreen> {
  var patientData = PatientResponse();
  var registerHistoryBloc = RegisterHistoryBloc();
  var timeLineBloc = TimeLineBloc();
  bool isCheck = false;
  bool isSave = false;
  int state = 0;
  TextEditingController graphStateController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    timeLineBloc = widget.timeLineBloc;
    timeLineBloc.getDataPathSubject.listen((response) {
      setState(() {
        patientData = response;
      });
    }, onError: (error) {});
    timeLineBloc.getDataGraphSubject.listen((response) {
      setState(() {});
    }, onError: (error) {});
    timeLineBloc.getDataPathSubject.listen((response) {
      setState(() {
        patientData = response;
      });
    }, onError: (error) {});
    timeLineBloc.getPathSubject.listen((response) {
      setState(() {});
    }, onError: (error) {});
    timeLineBloc.getDataGraphDefaultSubject.listen((response) {
      setState(() {
        timeLineBloc.dataGraph3[0].name.text = response.activity1!;
        timeLineBloc.dataGraph3[1].name.text = response.activity2!;
        timeLineBloc.dataGraph3[2].name.text = response.activity3!;
        timeLineBloc.dataGraph3[3].name.text = response.activity4!;
        timeLineBloc.dataGraph3[4].name.text = response.activity5!;
        timeLineBloc.dataGraph3[5].name.text = response.activity6!;
        timeLineBloc.dataGraph3[6].name.text = response.activity7!;
        timeLineBloc.dataGraph3[7].name.text = response.activity8!;
        timeLineBloc.dataGraph3[8].name.text = response.activity9!;
        timeLineBloc.dataGraph3[9].name.text = response.activity10!;
        timeLineBloc.dataGraph3[10].name.text = response.activity11!;

        timeLineBloc.dataGraph3[0].time.text = response.activity1Time!;
        timeLineBloc.dataGraph3[1].time.text = response.activity2Time!;
        timeLineBloc.dataGraph3[2].time.text = response.activity3Time!;
        timeLineBloc.dataGraph3[3].time.text = response.activity4Time!;
        timeLineBloc.dataGraph3[4].time.text = response.activity5Time!;
        timeLineBloc.dataGraph3[5].time.text = response.activity6Time!;
        timeLineBloc.dataGraph3[6].time.text = response.activity7Time!;
        timeLineBloc.dataGraph3[7].time.text = response.activity8Time!;
        timeLineBloc.dataGraph3[8].time.text = response.activity9Time!;
        timeLineBloc.dataGraph3[9].time.text = response.activity10Time!;
        timeLineBloc.dataGraph3[10].time.text = response.activity11Time!;

        timeLineBloc.dataGraph3[0].id = response.activity1Id.toString();
        timeLineBloc.dataGraph3[1].id = response.activity2Id.toString();
        timeLineBloc.dataGraph3[2].id = response.activity3Id.toString();
        timeLineBloc.dataGraph3[3].id = response.activity4Id.toString();
        timeLineBloc.dataGraph3[4].id = response.activity5Id.toString();
        timeLineBloc.dataGraph3[5].id = response.activity6Id.toString();
        timeLineBloc.dataGraph3[6].id = response.activity7Id.toString();
        timeLineBloc.dataGraph3[7].id = response.activity8Id.toString();
        timeLineBloc.dataGraph3[8].id = response.activity9Id.toString();
        timeLineBloc.dataGraph3[9].id = response.activity10Id.toString();
        timeLineBloc.dataGraph3[10].id = response.activity11Id.toString();
      });
    }, onError: (error) {});

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String dateNow() {
    var now = DateTime.now();
    return DateHelper.convertStringCalendarToDayAndTimeWithFormat(now) ?? "";
  }

  bool isValidate = false;
  PatientResponse data = PatientResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorBgLight,
        appBar: AppBar(
          //  backgroundColor: AppColor.colorFont,

          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 30, 71, 138),
                    Color.fromARGB(255, 44, 116, 242)
                  ]),
            ),
          ),
          bottomOpacity: 0.0,
          elevation: 0.5,
          centerTitle: true,
          title: Container(
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              )),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  takeScreenshotandShare(screenshotController);
                },
                child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.share_sharp,
                      color: Colors.white,
                      size: 20,
                    )))
          ],
        ),
        body: Screenshot(
            controller: screenshotController,
            child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _profileCardView(),
                      Card(
                          margin: EdgeInsets.all(0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24)),
                          ),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                    Card(
                                        color:
                                            Color.fromARGB(255, 200, 198, 198),
                                        margin: EdgeInsets.only(
                                            top: 25, bottom: 20),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: Container(
                                          width: 70,
                                          height: 5,
                                        )),
                                    Text(
                                      "บันทึกการทำกายภาพ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.colorFont),
                                    ),
                                    timeLineBloc.isSaveForm &&
                                            !timeLineBloc.isEditForm
                                        ? _historyView()
                                        : isSave
                                            ? showerView()
                                            : recordView()
                                  ]))))
                    ]))));
  }

  ScreenshotController screenshotController = ScreenshotController();

  showerView() {
    return SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 15, right: 10),
            // height: MediaQuery.of(context).size.width * 0.6,
            //width: MediaQuery.of(context).size.width * 0.ุ,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "แขน",
                          style: TextStyle(
                              color: AppColor.colorFont, fontSize: 14),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        _checkBoxTherapyView(
                            timeLineBloc.checkBoxTherapyDataName[0],
                            0,
                            setState),
                        _checkBoxTherapyView(
                            timeLineBloc.checkBoxTherapyDataName[1],
                            1,
                            setState),
                      ]),
                  SizedBox(
                    height: 15,
                  ),
                  graphHorizontal(setState, timeLineBloc.therapy1Controller),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ขา",
                          style: TextStyle(
                              color: AppColor.colorFont, fontSize: 14),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        _checkBoxTherapyView(
                            timeLineBloc.checkBoxTherapyDataName[2],
                            2,
                            setState),
                        _checkBoxTherapyView(
                            timeLineBloc.checkBoxTherapyDataName[3],
                            3,
                            setState),
                      ]),
                  SizedBox(
                    height: 15,
                  ),
                  graphHorizontal(setState, timeLineBloc.therapy2Controller),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "คอ",
                          style: TextStyle(
                              color: AppColor.colorFont, fontSize: 14),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        // _checkBoxTherapyView(
                        //     timeLineBloc
                        //         .checkBoxTherapyDataName[4],
                        //     4,
                        //     setState),
                        // _checkBoxTherapyView(
                        //     timeLineBloc
                        //         .checkBoxTherapyDataName[5],
                        //     5,
                        //     setState),
                      ]),
                  SizedBox(
                    height: 15,
                  ),
                  graphHorizontal(setState, timeLineBloc.therapy3Controller),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "หลัง",
                          style: TextStyle(
                              color: AppColor.colorFont, fontSize: 14),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        // _checkBoxTherapyView(
                        //     timeLineBloc
                        //         .checkBoxTherapyDataName[6],
                        //     6,
                        //     setState),
                        // _checkBoxTherapyView(
                        //     timeLineBloc
                        //         .checkBoxTherapyDataName[7],
                        //     7,
                        //     setState),
                      ]),
                  SizedBox(
                    height: 15,
                  ),
                  graphHorizontal(setState, timeLineBloc.therapy4Controller),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "ข้อมูลเพิ่มเติม :",
                    style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                  ),
                  Container(
                      width: 300,
                      //height: 30,
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        maxLines: 3,
                        controller: timeLineBloc.otherDetailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 144, 116, 114)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          hintText: "",
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            //    width: 110,
                            child: Text(
                          "เวลาที่ทำเสร็จ",
                          style: TextStyle(
                              color: AppColor.colorFont, fontSize: 14),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.access_time,
                            color: AppColor.colorFont, size: 22),
                        SizedBox(
                          width: 10,
                        ),
                        Card(
                            margin: EdgeInsets.all(5),
                            elevation: 2,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                DateHelper.convertTimeFormat(
                                        timeLineBloc.endTime)
                                    .substring(0, 1),
                                style: TextStyle(
                                    color: AppColor.colorFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            )),
                        Card(
                          margin: EdgeInsets.all(5),
                          elevation: 2,
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                DateHelper.convertTimeFormat(
                                        timeLineBloc.endTime)
                                    .substring(1, 2),
                                style: TextStyle(
                                    color: AppColor.colorFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              " : ",
                              style: TextStyle(
                                  color: AppColor.colorFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                        Card(
                          margin: EdgeInsets.all(5),
                          elevation: 2,
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                DateHelper.convertTimeFormat(
                                        timeLineBloc.endTime)
                                    .substring(3, 4),
                                style: TextStyle(
                                    color: AppColor.colorFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        ),
                        Card(
                          margin: EdgeInsets.all(5),
                          elevation: 2,
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                DateHelper.convertTimeFormat(
                                        timeLineBloc.endTime)
                                    .substring(4, 5),
                                style: TextStyle(
                                    color: AppColor.colorFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              " น. ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateHelper.convertStringCalendarToDayFormat(
                              timeLineBloc.endTime),
                          style: TextStyle(
                              color: AppColor.colorFont, fontSize: 14),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  esstimateView(setState),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          timeLineBloc.sendPhysical();
                          setState(() {
                            timeLineBloc.isSaveForm = true;
                            timeLineBloc.isEditForm = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.colorFont,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            padding: const EdgeInsets.all(2)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("บันทึก",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  textAlign: TextAlign.center)
                            ]),
                      )),
                ])));
  }

  String twoDigits(int n) => n.toString().padLeft(2, "0");

  recordView() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              height: 55,
              width: 230,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timeLineBloc.drugUseControllerList.forEach((element) {
                        element.text = "";
                      });
                      timeLineBloc.drugOtherControllerList.forEach((element) {
                        element.text = "";
                      });
                      timeLineBloc.mealController.text = "";
                      timeLineBloc.typeFoodController.text = "";
                      timeLineBloc.foodDetailController.text = "";
                      timeLineBloc.foodTestController.text = "";
                      timeLineBloc.foodPercentController.text = "";
                      timeLineBloc.ImageListData = [];
                      timeLineBloc.imageProfilePathSubject.sink
                          .add(timeLineBloc.ImageListData!);
                      if (state == 0 &&
                          !timeLineBloc
                              .dataGraphStatus[timeLineBloc.indexGraph]) {
                        timeLineBloc.startTime = timeLineBloc.getTime();
                        state = 1;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: state == 0 &&
                              !timeLineBloc
                                  .dataGraphStatus[timeLineBloc.indexGraph]
                          ? AppColor.colorFont
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.all(2)),
                  child: Text(
                    'เริ่ม',
                    style: TextStyle(
                        color: timeLineBloc
                                .dataGraphStatus[timeLineBloc.indexGraph]
                            ? Colors.grey
                            : state == 0
                                ? Colors.white
                                : (state == 1 || state == 2)
                                    ? Colors.grey
                                    : AppColor.colorFont,
                        fontSize: 18),
                  ))),
          SizedBox(
            height: 10,
          ),
          timeStart(),
          Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              height: 55,
              width: 230,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (state == 1 &&
                          !timeLineBloc
                              .dataGraphStatus[timeLineBloc.indexGraph]) {
                        timeLineBloc.endTime = DateTime.now();
                        state = 2;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: state == 1 ? AppColor.colorFont : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.all(2)),
                  child: Text(
                    'เสร็จสิ้น',
                    style: TextStyle(
                        color: timeLineBloc
                                .dataGraphStatus[timeLineBloc.indexGraph]
                            ? Colors.grey
                            : state == 1
                                ? Colors.white
                                : state == 2
                                    ? Colors.grey
                                    : AppColor.colorFont,
                        fontSize: 18),
                  ))),
          SizedBox(
            height: 10,
          ),
          timeEnd(),
          Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              height: 55,
              width: 230,
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      isSave = true;
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: state == 2 ? AppColor.colorFont : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.all(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+ ',
                      style: TextStyle(
                          color: state == 2
                              ? Colors.white
                              : state == 0
                                  ? Colors.grey
                                  : AppColor.colorFont,
                          fontSize: 18),
                    ),
                    Text(
                      'บันทึก',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: state == 2
                              ? Colors.white
                              : state == 0
                                  ? Colors.grey
                                  : AppColor.colorFont,
                          fontSize: 18),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 30,
          ),
        ]);
  }

  int currentValue = 0;
  int currentValue2 = 0;
  int currentValue3 = 0;
  Widget inputLevelView(setState, controller, i) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.0,
          color: AppColor.colorGrayTextLight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      elevation: 0,
      child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 35,
          // padding: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 30.0,
                    child: Text(controller.text,
                        style: TextStyle(
                            color: AppColor.colorGrayTextLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 12))),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 15.0,
                      child: InkWell(
                        child: Icon(Icons.arrow_drop_up,
                            size: 22.0, color: AppColor.colorGrayText),
                        onTap: () {
                          setState(() {
                            if (i == 1) {
                              currentValue++;
                              controller.text = (currentValue).toString();
                            } else if (i == 2) {
                              currentValue2++;
                              controller.text = (currentValue2).toString();
                            } else {
                              currentValue3++;
                              controller.text = (currentValue3).toString();
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        height: 15.0,
                        child: InkWell(
                          child: Icon(Icons.arrow_drop_down,
                              size: 22.0, color: AppColor.colorGrayText),
                          onTap: () {
                            setState(() {
                              if (currentValue >= 1) {
                                currentValue--;
                              }
                              controller.text =
                                  (currentValue > 0 ? currentValue : 0)
                                      .toString(); // decrementing value
                            });
                          },
                        )),
                  ],
                ),
              ])),
    );
  }

  timeStart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15,
        ),
        Icon(Icons.access_time, color: AppColor.colorFont, size: 22),
        SizedBox(
          width: 5,
        ),
        Card(
            margin: EdgeInsets.all(5),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.startTime)
                    .substring(0, 1),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )),
        Card(
          margin: EdgeInsets.all(5),
          elevation: 2,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.startTime)
                    .substring(1, 2),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
        Container(
            margin: EdgeInsets.all(5),
            child: Text(
              " : ",
              style: TextStyle(
                  color: AppColor.colorFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
        Card(
          margin: EdgeInsets.all(5),
          elevation: 2,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.startTime)
                    .substring(3, 4),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
        Card(
          margin: EdgeInsets.all(5),
          elevation: 2,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.startTime)
                    .substring(4, 5),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
        Container(
            margin: EdgeInsets.all(5),
            child: Text(
              " น. ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ))
      ],
    );
  }

  timeEnd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15,
        ),
        Icon(Icons.access_time, color: AppColor.colorFont, size: 22),
        SizedBox(
          width: 5,
        ),
        Card(
            margin: EdgeInsets.all(5),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.endTime)
                    .substring(0, 1),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )),
        Card(
          margin: EdgeInsets.all(5),
          elevation: 2,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.endTime)
                    .substring(1, 2),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
        Container(
            margin: EdgeInsets.all(5),
            child: Text(
              " : ",
              style: TextStyle(
                  color: AppColor.colorFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
        Card(
          margin: EdgeInsets.all(5),
          elevation: 2,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.endTime)
                    .substring(3, 4),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
        Card(
          margin: EdgeInsets.all(5),
          elevation: 2,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DateHelper.convertTimeFormat(timeLineBloc.endTime)
                    .substring(4, 5),
                style: TextStyle(
                    color: AppColor.colorFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
        Container(
            margin: EdgeInsets.all(5),
            child: Text(
              " น. ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ))
      ],
    );
  }

  Widget _profileCardView() {
    return _profileTextView();
  }

  Widget _profileTextView() {
    return Card(
        margin: EdgeInsets.all(10),
        color: AppColor.colorBgBlueLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          // side: BorderSide(color: Colors.black26, width: 1),
        ),
        child: Container(
            width: 310,
            // color: AppColor.colorBgBlueLight ,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                _imgView(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(
                                left: 5, right: 5, bottom: 2, top: 2),
                            child: Text(
                              patientData.hn.toString(),
                              style: TextStyle(
                                  color: AppColor.colorPrimary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.local_hotel,
                                      color: Colors.grey, size: 14),
                                  Text(
                                    " -",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        Icon(Icons.person_rounded,
                            color: AppColor.colorGrayText, size: 16),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          patientData.firstName.toString() +
                              " " +
                              patientData.lastName.toString(),
                          style: TextStyle(
                              fontSize: 14, color: AppColor.colorGrayText),
                        ),
                      ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        Text(
                          "เพศ" + patientData.gender.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.colorPrimary,
                          ),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 14, color: AppColor.colorGrayText),
                        ),
                        Text(
                          patientData.age != null
                              ? patientData.age.toString()
                              : "-",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.colorPrimary,
                          ),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(
                              fontSize: 14, color: AppColor.colorGrayText),
                        ),
                        Text(
                          "โรคประจำตัว                ",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.colorPrimary,
                          ),
                        ),
                      ])
                    ])
              ],
            )));
  }

  Widget _imgView() {
    return StreamBuilder<Uint8List>(
        stream: timeLineBloc.getImgPathSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: EdgeInsets.only(right: 10),
                child: imageCircleView(
                    size: 45,
                    fontsize: MediaQuery.of(context).size.width * 0.015,
                    status: false,
                    text: "",
                    subtitle: '',
                    image: snapshot.data));
          } else {
            return Container();
          }
        });
  }

  Widget _radioButtonView(List<String> data, txt, cont, setState, width) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            txt,
            style: TextStyle(color: AppColor.colorFont, fontSize: 14),
          ),
          Container(
              // height: MediaQuery.of(context).size.height * 0.2,
              //  width: 400,
              margin: EdgeInsets.only(left: 5),
              child: buildRadios(data, cont, setState, width)),
        ]);
  }

  int filter() {
    int filterLength = 0;
    timeLineBloc.ImageListData.forEach((element) {
      if (!element.isdel) {
        filterLength++;
      }
    });
    return filterLength;
  }

  Widget esstimateView(setState) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              //  alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "ประเมิน",
                style: TextStyle(color: AppColor.colorFont, fontSize: 14),
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        timeLineBloc.esstimateController.text = "ปกติ";
                      });
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.0,
                          color: timeLineBloc.esstimateController.text == "ปกติ"
                              ? AppColor.colorYellowChart
                              : AppColor.colorGrayTextLight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      elevation: 2,
                      child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "ปกติ",
                            style: TextStyle(
                                color: timeLineBloc.esstimateController.text ==
                                        "ปกติ"
                                    ? AppColor.colorYellowChart
                                    : AppColor.colorGrayTextLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                    )),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        timeLineBloc.esstimateController.text = "เฝ้าระวัง";
                      });
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.0,
                          color: timeLineBloc.esstimateController.text ==
                                  "เฝ้าระวัง"
                              ? AppColor.colorYellowChart
                              : AppColor.colorGrayTextLight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      elevation: 2,
                      child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "เฝ้าระวัง",
                            style: TextStyle(
                                color: timeLineBloc.esstimateController.text ==
                                        "เฝ้าระวัง"
                                    ? AppColor.colorYellowChart
                                    : AppColor.colorGrayTextLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                    )),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        timeLineBloc.esstimateController.text = "น่าเป็นห่วง";
                      });
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.0,
                          color: timeLineBloc.esstimateController.text ==
                                  "น่าเป็นห่วง"
                              ? AppColor.colorYellowChart
                              : AppColor.colorGrayTextLight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      elevation: 2,
                      child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "น่าเป็นห่วง",
                            style: TextStyle(
                                color: timeLineBloc.esstimateController.text ==
                                        "น่าเป็นห่วง"
                                    ? AppColor.colorYellowChart
                                    : AppColor.colorGrayTextLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                    )),
              ])
        ]);
  }

  Widget buildRadios(List<String> data, cont, setState, width) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        // alignment: Alignment.,
                        height: 50,
                        width: width,
                        child: RadioListTile<String>(
                          activeColor: AppColor.colorFont,
                          value: data[index],
                          contentPadding: EdgeInsets.zero,
                          groupValue: cont.text,
                          title: Text(
                            data[index],
                            style: TextStyle(fontSize: 11),
                            //,
                          ),
                          onChanged: (value) =>
                              setState(() => cont.text = value!),
                        ));
                  })),
        ]);
  }

 
  _inputView2(
      text, isEdit, controller, hint, width, unit, remark, colorRemark) {
    return Container(
        // width: 400,
        margin: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            text != ''
                ? Container(
                    width: 120,
                    child: Text(
                      text,
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ))
                : Container(),
            SizedBox(
              width: 5,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.14,
                child: Text(
                  controller.text,
                  style: TextStyle(fontSize: 14),
                )),
            SizedBox(
              width: 5,
            ),
            unit != ''
                ? Text(
                    unit,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
            text == "ชีพจร" &&
                    controller.text != "" &&
                    double.parse(controller.text) <= 40
                ? Text(
                    "ชีพจรเต้นช้า",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  )
                : text == "ชีพจร" &&
                        controller.text != "" &&
                        double.parse(controller.text) >= 120
                    ? Text(
                        "ชีพจรเต้นสูง",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      )
                    : text == "อุณหภูมิ" &&
                            controller.text != "" &&
                            double.parse(controller.text) >= 37.5
                        ? Text(
                            "ตัวร้อน",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          )
                        : text == "การหายใจ" &&
                                controller.text != "" &&
                                double.parse(controller.text) >= 26
                            ? Text(
                                "หายใจเร็ว",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            : text == "ระดับออกซิเจนในเลือด" &&
                                    controller.text != "" &&
                                    double.parse(controller.text) < 96
                                ? Text(
                                    "ออกซิเจนต่ำ",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  )
                                : Text(
                                    remark,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12),
                                  )
          ],
        ));
  }

  _contentView2() {
    return Container(
        margin: EdgeInsets.only(
          left: 10,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              _inputView2(
                  'น้ำหนัก',
                  true,
                  timeLineBloc.controllerWeight,
                  '',
                  MediaQuery.of(context).size.width * 0.13,
                  "ก.ก.",
                  "",
                  Colors.black),
              _inputView2(
                  'ส่วนสูง',
                  true,
                  timeLineBloc.controllerTall,
                  '',
                  MediaQuery.of(context).size.width * 0.13,
                  "ซ.ม.",
                  "",
                  Colors.black),
              _inputView2(
                  'อุณหภูมิ',
                  true,
                  timeLineBloc.controllerTemp,
                  '38',
                  MediaQuery.of(context).size.width * 0.13,
                  "°C",
                  '',
                  Colors.red),
              _inputView2(
                'ชีพจร',
                true,
                timeLineBloc.controllerHearthless1,
                '120',
                MediaQuery.of(context).size.width * 0.13,
                "ครั้ง/นาที",
                'ปกติ',
                Colors.red,
              ),
              _inputView2(
                'การหายใจ',
                true,
                timeLineBloc.controllerBeat1,
                '120',
                MediaQuery.of(context).size.width * 0.13,
                "ครั้ง/นาที",
                'ปกติ',
                Colors.red,
              ),
              _inputViewColumn2(
                  'ความดันโลหิต',
                  true,
                  timeLineBloc.controllerBloodPl1,
                  timeLineBloc.controllerBloodPl2,
                  '120',
                  '80',
                  40.0,
                  "mm/Hg",
                  "ปกติ",
                  Colors.green),
              _inputView2(
                  'ระดับออกซิเจนในเลือด',
                  true,
                  timeLineBloc.controllerO2,
                  '',
                  30.0,
                  "%",
                  "ปกติ",
                  Colors.green),
              SizedBox(
                height: 20,
              ),
            ]));
  }

  _inputViewColumn2(text, isEdit, controller1, controller2, hint1, hint2, width,
      unit, remark, colorRemark) {
    return Row(children: [
      Container(
          margin: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              text != ''
                  ? Container(
                      width: 100,
                      child: Text(
                        text,
                        style:
                            TextStyle(color: AppColor.colorFont, fontSize: 14),
                      ))
                  : Container(),
              SizedBox(
                width: 5,
              ),
              Container(
                  width: width,
                  child: Text(
                    controller1.text,
                    style: TextStyle(fontSize: 14),
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                "/",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                  //  width: width,
                  child: Text(
                controller2.text,
                style: TextStyle(fontSize: 14),
              )),
              SizedBox(
                width: 10,
              ),
              Text(
                unit,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(
                width: 10,
              ),
              text == "ความดันโลหิต" &&
                      controller1.text != "" &&
                      controller2.text != "" &&
                      (double.parse(controller1.text) >= 120 ||
                          double.parse(controller2.text) >= 80)
                  ? Text(
                      "ความดันสูง",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    )
                  : Text(
                      remark,
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
            ],
          ))
    ]);
  }

  Widget imageList(List<ImageData> data) {
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        // width: MediaQuery.of(context).size.width * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onLongPress: () {
                  scrollController.animateTo(scrollController.offset + 150,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 100));
                },
                onTap: () {
                  scrollController.animateTo(scrollController.offset - 50,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 100));
                },
                child: Icon(Icons.arrow_back_ios,
                    color: AppColor.colorFont, size: 20)),
            SizedBox(
              width: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 140,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 100,
                        //  height: 100,
                        padding:
                            EdgeInsets.only(right: 15, top: 25, bottom: 25),
                        child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  data![index].FoodImageFile,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ))),
                      );
                    })),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onLongPress: () {
                  scrollController.animateTo(scrollController.offset + 150,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 100));
                },
                onTap: () {
                  scrollController.animateTo(scrollController.offset + 50,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 100));
                },
                child: Icon(Icons.arrow_forward_ios,
                    color: AppColor.colorFont, size: 20)),
          ],
        ));
  }

  fn(setState) {
    setState(() {});
  }

  Widget _uploadImageView(setState) {
    return StreamBuilder<List<ImageData>>(
        stream: timeLineBloc.imageProfilePathSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Container(
                height: 150,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: filter() == 0 ? 1 : snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return filter() == 0
                          ? addImg(setState)
                          : index == snapshot.data!.length - 1 &&
                                  !snapshot.data![index].isdel
                              ? Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Center(
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.memory(
                                                  snapshot.data![index]
                                                      .FoodImageFile,
                                                  width: 70,
                                                  height: 70,
                                                  fit: BoxFit.fill,
                                                ))),
                                        _remove(index, setState)
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    addImg(setState)
                                  ],
                                )
                              : !snapshot.data![index].isdel
                                  ? Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Center(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.memory(
                                                      snapshot.data![index]
                                                          .FoodImageFile,
                                                      width: 70,
                                                      height: 70,
                                                      fit: BoxFit.fill,
                                                    ))),
                                            _remove(index, setState)
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        filter() <= 1
                                            ? addImg(setState)
                                            : Container()
                                      ],
                                    )
                                  : Container();
                    }));
          } else {
            return imageView(setState);
          }
        });
  }

  _remove(index, setState) {
    return InkWell(
        onTap: () {
          setState(() {
            timeLineBloc.ImageListData[index].isdel = true;
            //  timeLineBloc.ImageListData.removeAt(index);
          });
        },
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 25, left: 30),
                child: Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 25,
                )),
            Padding(
                padding: EdgeInsets.only(top: 25, left: 30),
                child: Icon(
                  Icons.cancel,
                  color: AppColor.colorGrayLight,
                  size: 25,
                ))
          ],
        ));
  }

  addImg(setState) {
    return InkWell(
        onTap: () {
          _showCamera(setState);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  color: AppColor.colorGrayLight,
                  size: 20,
                ),
                Text(
                  "เพิ่มรูปภาพ",
                  style:
                      TextStyle(color: AppColor.colorGrayLight, fontSize: 10),
                ),
              ],
            ),
            DottedBorder(
                borderType: BorderType.Rect,
                color: AppColor.colorGrayLight,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(shape: BoxShape.rectangle),
                ))
          ],
        ));
  }

  Widget imageView(setState) {
    return InkWell(
        onTap: () {
          _showCamera(setState);
        },
        child: Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.025),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: AppColor.colorGrayLight,
                      size: 20,
                    ),
                    DottedBorder(
                        borderType: BorderType.Rect,
                        dashPattern: const [3, 6],
                        color: Colors.black,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                        ))
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: AppColor.colorGrayLight,
                          size: 20,
                        ),
                        Text(
                          "เพิ่มรูปภาพ",
                          style: TextStyle(
                              color: AppColor.colorGrayLight, fontSize: 12),
                        ),
                      ],
                    ),
                    DottedBorder(
                        borderType: BorderType.Rect,
                        color: AppColor.colorGrayLight,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                        ))
                  ],
                ),
              ],
            )));
  }

  _showCamera(setState) async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (ctx) {
          return Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              height: 220,
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 10, right: 10, left: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "",
                                style: TextStyle(
                                    color: AppColor.colorFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.cancel,
                                size: 35,
                                // color: icon_gray,
                              ))
                        ])),
                Padding(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 10, right: 20, left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                timeLineBloc.openImagePickerPathSubject(
                                    timeLineBloc.imageProfilePathSubject,
                                    fn,
                                    setState);
                                Navigator.of(context, rootNavigator: true)
                                    .pop("Discard");
                              },
                              child: Container(
                                  width: 160,
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    //   color: light_gray,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        size: 35,
                                        color: AppColor.colorFont,
                                      ),
                                      Text(
                                        'GALLERY',
                                        style: TextStyle(
                                            color: AppColor.colorFont,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ))),
                          InkWell(
                              onTap: () async {
                                timeLineBloc.openCamera();
                                Navigator.of(context, rootNavigator: true)
                                    .pop("Discard");
                              },
                              child: Container(
                                  width: 160,
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    //   color: light_gray,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.camera_alt,
                                        size: 35,
                                        color: AppColor.colorFont,
                                      ),
                                      Text(
                                        'CAMERA',
                                        style: TextStyle(
                                            color: AppColor.colorFont,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )))
                        ]))
              ]));
        });
  }

  Widget _historyView() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10, right: 15),
              //  width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "แขน ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      (timeLineBloc.checkBoxTherapyData[0]
                              ? timeLineBloc.checkBoxTherapyDataName[0]
                              : "") +
                          "  " +
                          (timeLineBloc.checkBoxTherapyData[1]
                              ? timeLineBloc.checkBoxTherapyDataName[1]
                              : ""),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              // width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "การตอบสนอง ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            state = 0;
                          });
                        },
                        child: Card(
                          color: timeLineBloc.therapy1Controller.text == "แย่"
                              ? AppColor.colorOrengeTimeLine
                              : timeLineBloc.therapy1Controller.text ==
                                      "ไม่ตอบสนอง"
                                  ? Colors.red
                                  : timeLineBloc.therapy1Controller.text == "ดี"
                                      ? AppColor.colorGreenStatus
                                      : AppColor.colorGreenIcon,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          elevation: 2,
                          child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                timeLineBloc.therapy1Controller.text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        )),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ขา ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text((timeLineBloc.checkBoxTherapyData[2]
                            ? timeLineBloc.checkBoxTherapyDataName[2]
                            : "") +
                        "  " +
                        (timeLineBloc.checkBoxTherapyData[3]
                            ? timeLineBloc.checkBoxTherapyDataName[3]
                            : "")),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              // width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "การตอบสนอง ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            state = 0;
                          });
                        },
                        child: Card(
                          color: timeLineBloc.therapy2Controller.text == "แย่"
                              ? AppColor.colorOrengeTimeLine
                              : timeLineBloc.therapy2Controller.text ==
                                      "ไม่ตอบสนอง"
                                  ? Colors.red
                                  : timeLineBloc.therapy2Controller.text == "ดี"
                                      ? AppColor.colorGreenStatus
                                      : AppColor.colorGreenIcon,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          elevation: 2,
                          child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                timeLineBloc.therapy2Controller.text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        )),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "คอ ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text((timeLineBloc.checkBoxTherapyData[4]
                            ? timeLineBloc.checkBoxTherapyDataName[4]
                            : "") +
                        "  " +
                        (timeLineBloc.checkBoxTherapyData[5]
                            ? timeLineBloc.checkBoxTherapyDataName[5]
                            : "")),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              // width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "การตอบสนอง ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            state = 0;
                          });
                        },
                        child: Card(
                          color: timeLineBloc.therapy3Controller.text == "แย่"
                              ? AppColor.colorOrengeTimeLine
                              : timeLineBloc.therapy3Controller.text ==
                                      "ไม่ตอบสนอง"
                                  ? Colors.red
                                  : timeLineBloc.therapy3Controller.text == "ดี"
                                      ? AppColor.colorGreenStatus
                                      : AppColor.colorGreenIcon,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          elevation: 2,
                          child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                timeLineBloc.therapy3Controller.text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        )),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              // width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "หลัง ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text((timeLineBloc.checkBoxTherapyData[6]
                            ? timeLineBloc.checkBoxTherapyDataName[6]
                            : "") +
                        "  " +
                        (timeLineBloc.checkBoxTherapyData[7]
                            ? timeLineBloc.checkBoxTherapyDataName[7]
                            : "")),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              //width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "การตอบสนอง ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            state = 0;
                          });
                        },
                        child: Card(
                          color: timeLineBloc.therapy4Controller.text == "แย่"
                              ? AppColor.colorOrengeTimeLine
                              : timeLineBloc.therapy4Controller.text ==
                                      "ไม่ตอบสนอง"
                                  ? Colors.red
                                  : timeLineBloc.therapy4Controller.text == "ดี"
                                      ? AppColor.colorGreenStatus
                                      : AppColor.colorGreenIcon,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          elevation: 2,
                          child: Container(
                              alignment: Alignment.center,
                              width: 130,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                timeLineBloc.therapy4Controller.text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        )),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              //width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ข้อมูลเพิ่มเติม :",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      timeLineBloc.otherDetailController.text,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ])),
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "เวลาที่เริ่ม",
                    style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.access_time, color: AppColor.colorFont, size: 22),
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.startTime)
                              .substring(0, 1),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.startTime)
                              .substring(1, 2),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        " : ",
                        style: TextStyle(
                            color: AppColor.colorFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  Card(
                    margin: EdgeInsets.all(5),
                    elevation: 2,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.startTime)
                              .substring(3, 4),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                  Card(
                    margin: EdgeInsets.all(5),
                    elevation: 2,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.startTime)
                              .substring(4, 5),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        " น. ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ]),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            // width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "เวลาที่ทำเสร็จ",
                    style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.access_time, color: AppColor.colorFont, size: 22),
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                      margin: EdgeInsets.all(5),
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.endTime)
                              .substring(0, 1),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),
                  Card(
                    margin: EdgeInsets.all(5),
                    elevation: 2,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.endTime)
                              .substring(1, 2),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        " : ",
                        style: TextStyle(
                            color: AppColor.colorFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  Card(
                    margin: EdgeInsets.all(5),
                    elevation: 2,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.endTime)
                              .substring(3, 4),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                  Card(
                    margin: EdgeInsets.all(5),
                    elevation: 2,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          DateHelper.convertTimeFormat(timeLineBloc.endTime)
                              .substring(4, 5),
                          style: TextStyle(
                              color: AppColor.colorFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        " น. ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ]),
          ),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              // width: MediaQuery.of(context).size.width * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "เวลาที่ใช้ในการทำ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Card(
                      margin: EdgeInsets.all(5),
                      elevation: 2,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            twoDigits(timeLineBloc.endTime
                                    .difference(timeLineBloc.startTime)
                                    .inHours)
                                .substring(0, 1),
                            style: TextStyle(
                                color: AppColor.colorFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ),
                    Card(
                      margin: EdgeInsets.all(5),
                      elevation: 2,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            twoDigits(timeLineBloc.endTime
                                    .difference(timeLineBloc.startTime)
                                    .inHours)
                                .substring(1, 2),
                            style: TextStyle(
                                color: AppColor.colorFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          " ชั่วโมง ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                    Card(
                      margin: EdgeInsets.all(5),
                      elevation: 2,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            twoDigits(timeLineBloc.endTime
                                    .difference(timeLineBloc.startTime)
                                    .inMinutes
                                    .remainder(60))
                                .substring(0, 1),
                            style: TextStyle(
                                color: AppColor.colorFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ),
                    Card(
                      margin: EdgeInsets.all(5),
                      elevation: 2,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            twoDigits(timeLineBloc.endTime
                                    .difference(timeLineBloc.startTime)
                                    .inMinutes
                                    .remainder(60))
                                .substring(1, 2),
                            style: TextStyle(
                                color: AppColor.colorFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          " นาที ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ])),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              // width: MediaQuery.of(context).size.width * 0.45,
              child: esstimateView(setState)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timeLineBloc.isSaveForm = false;
                        timeLineBloc.isEditForm = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColor.colorFont,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.all(2)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("แก้ไข",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              textAlign: TextAlign.center)
                        ]),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]);
  }

  Widget graphHorizontal(setState, controller) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          graphHorizontalItem(
              setState, 0, "ดี", AppColor.colorGreenStatus, controller),
          graphHorizontalItem(
              setState, 1, "ปานกลาง", AppColor.colorGreenIcon, controller),
          graphHorizontalItem(
              setState, 2, "แย่", AppColor.colorOrengeTimeLine, controller),
          graphHorizontalItem(
              setState, 3, "ไม่ตอบสนอง", Colors.red, controller),
        ]);
  }

  // int stateGraph = -1;
  Widget graphHorizontalItem(setState, state, txt, color, controller) {
    return InkWell(
        onTap: () {
          setState(() {
            // stateGraph = state;
            controller.text = txt;
          });
        },
        child: Card(
          margin: controller.text == txt
              ? EdgeInsets.only(left: 5, right: 5)
              : EdgeInsets.zero,
          color: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: controller.text == txt ? 5.0 : 0,
              color: controller.text == txt ? color : Colors.white,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: state == 0 ? Radius.circular(16) : Radius.zero,
              topLeft: state == 0 ? Radius.circular(16) : Radius.zero,
              bottomRight: state == 3 ? Radius.circular(16) : Radius.zero,
              topRight: state == 3 ? Radius.circular(16) : Radius.zero,
            ),
          ),
          elevation: 1,
          child: Container(
              alignment: Alignment.center,
              width: 80,
              padding: controller.text == txt
                  ? EdgeInsets.all(2)
                  : EdgeInsets.all(5),
              child: Text(
                txt,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              )),
        ));
  }

  Widget _checkBoxTherapyView(txt, index, setState) {
    return Container(
        height: 30,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              fillColor: !timeLineBloc.checkbox() && isCheck
                  ? MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                      return Colors.red;
                    })
                  : null,
              checkColor: Colors.white,
              activeColor: AppColor.colorFont,
              value: timeLineBloc.checkBoxTherapyData[index],
              onChanged: (bool? value) {
                setState(() {
                  timeLineBloc.checkBoxTherapyData[index] = value!;
                });
              },
            ),
            Text(
              txt,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ));
  }
}