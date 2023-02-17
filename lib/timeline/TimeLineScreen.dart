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

import '../app/app_screen.dart';
import '../component/TimeLineStepView.dart';
import '../component/imageCircleView.dart';
import '../helper/DateHelper.dart';
import '../model.dart';
import 'RegisterHistoryBloc.dart';
import 'TimeLineBloc.dart';

class TimeLineScreen extends StatefulWidget {
  String id;
  TimeLineScreen(this.id);
  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  var patientData = PatientResponse();
  var registerHistoryBloc = RegisterHistoryBloc();
  var timeLineBloc = TimeLineBloc();
  bool isCheck = false;
  bool isSave = true;
  int state = 0;
  TextEditingController graphStateController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    timeLineBloc.userId = widget.id;
    timeLineBloc.setData();
    timeLineBloc.getShowerList();
    timeLineBloc.getSelectTimeline();
    callImg(widget.id, timeLineBloc.getImgPathSubject);
    timeLineBloc.fetchUser(widget.id);
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
    timeLineBloc.getTimeline();
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AppScreen(2)),
                  (route) => false,
                );
              },
            )),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _imgView(),
                    Text(
                      patientData.firstName.toString() +
                          " " +
                          patientData.lastName.toString(),
                      style: TextStyle(fontSize: 16, color: AppColor.colorFont),
                    )
                  ]),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _graphView(),
                  ]),
            ],
          ),
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
                    size: 20,
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

  Widget _graphView() {
    return Card(
      margin: EdgeInsets.all(2),
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
      ),
      child: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.6,
            //margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    height: 10,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        )),
                    margin: const EdgeInsets.only(left: 10, right: 2, top: 10),
                    width: 100,
                    child: DropdownButton<dropdownData>(
                      //  value: data[0],
                      iconSize: 24,
                      isExpanded: true,
                      icon: Icon(Icons.settings,
                          color: AppColor.colorFont, size: 20),
                      iconEnabledColor: Colors.black,
                      underline: const SizedBox(),
                      onChanged: (newValue) {
                        setState(() {
                          if (newValue!.name == "สร้างไทม์ไลน์เพิ่ม") {
                            timeLineBloc.newTimeLine();
                            if (timeLineBloc.isGraph1) {
                              timeLineBloc.selectTimeLine = 2;
                            }
                            timeLineBloc.isEdit = false;
                            isSave = false;
                          }
                          if (newValue!.name == "เลือกไทม์ไลน์") {
                            setState(
                              () {
                                timeLineBloc.onSelectTimeLine = true;
                                timeLineBloc.check();
                              },
                            );
                          }
                          if (newValue!.name == "แก้ไขไทม์ไลน์นี้") {
                            timeLineBloc.isEdit = true;
                            isSave = false;
                          }
                          print(newValue.toString());
                          // controller.text = newValue!.name;
                          //  print(data.getIcon(controller.text).toString());
                        });
                      },
                      items: timeLineBloc.dataSettingGraph
                          .map<DropdownMenuItem<dropdownData>>(
                              (dropdownData value) {
                        return DropdownMenuItem<dropdownData>(
                          value: value,
                          child: Text(value.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        );
                      }).toList(),
                    ))
              ],
            )),
        timeLineBloc.onSelectTimeLine
            ? Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("เลือกไทม์ไลน์",
                                style: const TextStyle(
                                  color: AppColor.colorFont,
                                  fontSize: 16,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      timeLineBloc.onSelectTimeLine = false;
                                      timeLineBloc.getDefaultTimeline();
                                    },
                                  );
                                },
                                child: Card(
                                    margin: EdgeInsets.all(5),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4)),
                                    ),
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.calendar_month,
                                                  color: AppColor.colorFont,
                                                  size: 16),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text("Default Timeline",
                                                  style: const TextStyle(
                                                    color: AppColor.colorFont,
                                                    fontSize: 16,
                                                  ))
                                            ])))),
                            StreamBuilder<List<TimelineResponse>>(
                                stream: timeLineBloc
                                    .getDataGraphSelectSubject.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                        width: 160,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            controller: scrollController,
                                            //   physics: NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: snapshot.data!.length,
                                            //  padding: EdgeInsets.only(top: 15),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                  onTap: () {
                                                    setState(
                                                      () {
                                                        timeLineBloc
                                                                .onSelectTimeLine =
                                                            false;
                                                        timeLineBloc
                                                            .chooseTimeLine(
                                                                snapshot.data![
                                                                    index]);
                                                      },
                                                    );
                                                  },
                                                  child: Card(
                                                      margin: EdgeInsets.all(5),
                                                      elevation: 3,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        4),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            4)),
                                                      ),
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    color: AppColor
                                                                        .colorFont,
                                                                    size: 16),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                    DateHelper.convertDateFromApiTH(snapshot
                                                                        .data![
                                                                            index]
                                                                        .ddate
                                                                        .toString()),
                                                                    style:
                                                                        const TextStyle(
                                                                      color: AppColor
                                                                          .colorFont,
                                                                      fontSize:
                                                                          16,
                                                                    ))
                                                              ]))));
                                            }));
                                  } else {
                                    return Text("ไม่มีข้อมูล",
                                        style: const TextStyle(
                                          color: AppColor.colorFont,
                                          fontSize: 16,
                                        ));
                                  }
                                })
                          ])
                    ]))
            : Container(),
        Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Stack(children: [
              TimeLineStepView(
                  color: Colors.red,
                  colorlight: AppColor.colorRedTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[0].name),
                  step: 0,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[0].time,
                  controllerName: timeLineBloc.dataGraph3[0].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[0],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Colors.pink,
                  colorlight: AppColor.colorPinkTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[1].name),
                  step: 1,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[1].time,
                  controllerName: timeLineBloc.dataGraph3[1].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[1],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Colors.yellow,
                  colorlight: AppColor.colorYellowTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[2].name),
                  step: 2,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[2].time,
                  controllerName: timeLineBloc.dataGraph3[2].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[2],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Colors.orangeAccent,
                  colorlight: AppColor.colorOrengeTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[3].name),
                  step: 3,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[3].time,
                  controllerName: timeLineBloc.dataGraph3[3].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[3],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Color.fromARGB(255, 56, 172, 124),
                  colorlight: AppColor.colorLimeTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[4].name),
                  step: 4,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[4].time,
                  controllerName: timeLineBloc.dataGraph3[4].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[4],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Color.fromARGB(255, 36, 124, 80),
                  colorlight: AppColor.colorGreenTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[5].name),
                  step: 5,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[5].time,
                  controllerName: timeLineBloc.dataGraph3[5].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[5],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Color.fromARGB(255, 47, 146, 105),
                  colorlight: AppColor.colorDarkGreenTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[6].name),
                  step: 6,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[6].time,
                  controllerName: timeLineBloc.dataGraph3[6].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[6],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Color.fromARGB(255, 65, 175, 239),
                  colorlight: AppColor.colorBlueTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[7].name),
                  step: 7,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[7].time,
                  controllerName: timeLineBloc.dataGraph3[7].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[7],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Color.fromARGB(255, 38, 58, 184),
                  colorlight: AppColor.colorDarkBlueTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[8].name),
                  step: 8,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[8].time,
                  controllerName: timeLineBloc.dataGraph3[8].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[8],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Color.fromARGB(255, 114, 35, 188),
                  colorlight: AppColor.colorPurpleTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[9].name),
                  step: 9,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[9].time,
                  controllerName: timeLineBloc.dataGraph3[9].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[9],
                  onSelect: graphStateController),
              TimeLineStepView(
                  color: Color.fromARGB(255, 31, 30, 32),
                  colorlight: AppColor.colorGrayTimeLine,
                  icon: timeLineBloc.getIcon(timeLineBloc.dataGraph3[10].name),
                  step: 10,
                  setState: setState,
                  controller: timeLineBloc.dataGraph3[10].time,
                  controllerName: timeLineBloc.dataGraph3[10].name,
                  timeLineBloc: timeLineBloc,
                  isSave: isSave,
                  status: timeLineBloc.dataGraphStatus[10],
                  onSelect: graphStateController),
            ])),
        SizedBox(
          height: 30,
        ),
        !isSave
            ? Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSave = !isSave;
                      //timeLineBloc.save();
                      timeLineBloc.postTimeline();
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
                                color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.center)
                      ]),
                ))
            : Container(),
        SizedBox(
          height: 30,
        )
      ]),
    );
  }
}