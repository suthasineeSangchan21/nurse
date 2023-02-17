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

class MedicineScreen extends StatefulWidget {
  String id;
  TimeLineBloc timeLineBloc;
  MedicineScreen(this.id, this.timeLineBloc);
  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  var patientData = PatientResponse();
  var registerHistoryBloc = RegisterHistoryBloc();
  var timeLineBloc = TimeLineBloc();
  bool isCheck = false;
  bool isSave = true;
  int state = 0;
  TextEditingController graphStateController = TextEditingController();
  ScrollController scrollController = ScrollController();
  ScreenshotController screenshotController = ScreenshotController();

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
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      "บันทึกการใช้ยา",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.colorFont),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    timeLineBloc.isSaveForm &&
                                            !timeLineBloc.isEditForm
                                        ? _historyView()
                                        : medicineView()
                                  ]))))
                    ]))));
  }

  medicineView() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: timeLineBloc.drugUserResponse.length,
                      itemBuilder: (BuildContext context, int index) {
                        return timeLineBloc.medicineId.toString() ==
                                timeLineBloc.drugUserResponse[index].id
                                    .toString()
                            ? _itemMedicine2(
                                index, timeLineBloc.drugUserResponse[index])
                            : Container();
                      })),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "เวลาที่ทำเสร็จ",
                            style: TextStyle(
                                color: AppColor.colorFont, fontSize: 14),
                          ),
                          Text(
                            "เรียบร้อย",
                            style: TextStyle(
                                color: AppColor.colorFont, fontSize: 14),
                          ),
                        ]),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        _timeView(),
                        Text(
                          DateHelper.convertStringCalendarToDayFormat(
                              timeLineBloc.endTime),
                          style: TextStyle(
                              color: AppColor.colorFont, fontSize: 14),
                        ),
                      ],
                    )
                  ]),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "เวลาที่ใช้ในการทำ",
                      style: TextStyle(color: AppColor.colorFont, fontSize: 14),
                    ),
                    SizedBox(
                      width: 5,
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
                                fontSize: 14),
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
                                fontSize: 14),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          " ชั่วโมง ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
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
                                fontSize: 14),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          " นาที ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
                  ]),
              SizedBox(
                height: 20,
              ),
              esstimateView(setState),
              SizedBox(
                height: 10,
              ),
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Text(
              //         "Product",
              //         style: TextStyle(color: AppColor.colorFont, fontSize: 14),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       InkWell(
              //           onTap: () {},
              //           child: Container(
              //               width: 200,
              //               height: 30,
              //               margin: EdgeInsets.only(left: 10),
              //               child: TextField(
              //                 maxLines: 1,
              //                 decoration: InputDecoration(
              //                   enabledBorder: OutlineInputBorder(
              //                     borderSide: BorderSide(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(5.0),
              //                   ),
              //                   focusedBorder: OutlineInputBorder(
              //                     borderSide: BorderSide(
              //                         color:
              //                             Color.fromARGB(255, 144, 116, 114)),
              //                     borderRadius: BorderRadius.circular(5.0),
              //                   ),
              //                   disabledBorder: OutlineInputBorder(
              //                     borderSide: BorderSide(color: Colors.grey),
              //                     borderRadius: BorderRadius.circular(5.0),
              //                   ),
              //                   contentPadding: EdgeInsets.only(
              //                       left: 10, right: 10, top: 10),
              //                   suffixIcon: InkWell(
              //                       onTap: () {},
              //                       child: Container(
              //                           width: 5,
              //                           height: 5,
              //                           padding: EdgeInsets.all(7),
              //                           child: SvgPicture.asset(
              //                             'assets/images/cart.svg',
              //                             fit: BoxFit.contain,
              //                             color: AppColor.colorFont,
              //                           ))),
              //                   hintText: "",
              //                 ),
              //               ))),
              //     ]),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timeLineBloc.sendLoopDrug();
                        timeLineBloc.isSaveForm = true;
                        timeLineBloc.isEditForm = false;
                        // timeLineBloc.getPathSubject.sink.add(true);
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
              SizedBox(
                height: 20,
              ),
            ]));
  }

  String twoDigits(int n) => n.toString().padLeft(2, "0");

  Widget _itemMedicine(int index, DrugUserResponse data) {
    return Stack(children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
                margin: EdgeInsets.only(left: 10, top: 10),
                color: AppColor.colorBgBlueLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "ยา",
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data.drugName.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  data.amount.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  " ",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  data.amountUnit.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "วิธีใช้",
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data.howto.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "ประเภท",
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data.drugGroup.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "สาเหตุการใช้ยา",
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  timeLineBloc.drugOtherController.text,
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                              ]),
                        ]))),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ข้อมูลเพิ่มเติม :",
                        style:
                            TextStyle(color: AppColor.colorFont, fontSize: 14),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        timeLineBloc.otherDetailController.text,
                        style:
                            TextStyle(color: AppColor.colorFont, fontSize: 14),
                      ),
                    ])),
          ]),
      Container(
          margin: EdgeInsets.only(bottom: 5, right: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                  width: 20,
                  height: 20,
                  color: AppColor.colorFont,
                  alignment: Alignment.center,
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )))),
    ]);
  }

  Widget _timeView() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
        ]);
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

  Widget esstimateView(setState) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              //  padding: EdgeInsets.only(top: 10),
              child: Text(
                "ประเมิน",
                style: TextStyle(color: AppColor.colorFont, fontSize: 14),
              )),
          SizedBox(
            width: 10,
          ),
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
                          color: timeLineBloc.esstimateController.text == "ปกติ"
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
                    color: timeLineBloc.esstimateController.text == "เฝ้าระวัง"
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
                    color:
                        timeLineBloc.esstimateController.text == "น่าเป็นห่วง"
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

  Widget _itemMedicine2(int index, DrugUserResponse data) {
    return Stack(children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
                margin: EdgeInsets.only(left: 10, top: 10),
                color: AppColor.colorBgBlueLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "ยา",
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data.drugName.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data.amount.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  " ",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  data.amountUnit.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "วิธีใช้",
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data.howto.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "ประเภท",
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data.drugGroup.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ]),
                        ]))),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "สาเหตุการใช้ยา",
                        style:
                            TextStyle(color: AppColor.colorFont, fontSize: 14),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 30,
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            maxLines: 1,
                            controller: timeLineBloc.drugOtherController,
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
                          ))
                    ])),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ข้อมูลเพิ่มเติม :",
                        style:
                            TextStyle(color: AppColor.colorFont, fontSize: 14),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          //height: 30,
                          margin: EdgeInsets.only(top: 15),
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
                          ))
                    ])),
          ]),
      Container(
          margin: EdgeInsets.only(bottom: 5, right: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                  width: 20,
                  height: 20,
                  color: AppColor.colorFont,
                  alignment: Alignment.center,
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )))),
    ]);
  }

  Widget _historyView() {
    return Column(children: [
      Container(
          // padding: EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: timeLineBloc.drugUserResponse.length,
              itemBuilder: (BuildContext context, int index) {
                return timeLineBloc.medicineId.toString() ==
                        timeLineBloc.drugUserResponse[index].id.toString()
                    ? Container(
                        child: _itemMedicine(
                            index, timeLineBloc.drugUserResponse[index]))
                    : Container();
              })),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
            ),
            Text(
              "เวลาที่ทำเสร็จ",
              style: TextStyle(color: AppColor.colorFont, fontSize: 14),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.access_time, color: AppColor.colorFont, size: 16),
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
                        fontSize: 14),
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
                        fontSize: 14),
                  )),
            ),
            Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  " : ",
                  style: TextStyle(
                      color: AppColor.colorFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
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
      SizedBox(
        height: 10,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "เวลาที่ใช้ในการทำ",
              style: TextStyle(color: AppColor.colorFont, fontSize: 14),
            ),
            SizedBox(
              width: 5,
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
                        fontSize: 14),
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
                        fontSize: 14),
                  )),
            ),
            Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  " ชั่วโมง ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
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
                        fontSize: 14),
                  )),
            ),
            Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  " นาที ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )),
          ]),
      SizedBox(
        height: 20,
      ),
      esstimateView(setState),
      SizedBox(
        height: 20,
      ),
      Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
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
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center)
                ]),
          )),
      SizedBox(
        height: 20,
      ),
    ]);
  }
}