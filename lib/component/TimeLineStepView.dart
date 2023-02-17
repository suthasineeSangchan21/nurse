import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurse_app/model.dart';

import '../theme/color.dart';
import '../timeline/ActivityScreen.dart';
import '../timeline/FlipScreen.dart';
import '../timeline/FoodScreen.dart';
import '../timeline/HealthScreen.dart';
import '../timeline/MedicineScreen.dart';
import '../timeline/PhlegmScreen.dart';
import '../timeline/ShowerScreen.dart';
import '../timeline/TherapyScreen.dart';
import '../timeline/TimeLineBloc.dart';
import '../timeline/WipeScreen.dart';
import '../timeline/WoundScreen.dart';
import 'dialog/calendarView.dart';

class TimeLineStepView extends StatelessWidget {
  String icon;
  Color color;
  Color colorlight;
  int step;
  dynamic setState;
  TextEditingController controller;
  TextEditingController controllerName;
  TimeLineBloc timeLineBloc;
  bool isSave;
  bool status;
  TextEditingController onSelect;
  TimeLineStepView({
    Key? key,
    required this.icon,
    required this.color,
    required this.colorlight,
    required this.step,
    required this.setState,
    required this.controller,
    required this.controllerName,
    required this.timeLineBloc,
    required this.isSave,
    required this.status,
    required this.onSelect,
  }) : super(key: key);

  double size = 0.9;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: step * 80.0),
            child: Stack(alignment: Alignment.topCenter, children: [
              Container(
                  margin: EdgeInsets.only(
                    top: 80 * size,
                  ),
                  width: 60 * size,
                  height: 70 * size,
                  child: SvgPicture.asset(
                    'assets/icon/ic_timeline.svg',
                    fit: BoxFit.contain,
                    color: colorlight,
                  )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    step % 2 == 0
                        ? _TextViewLeft(context)
                        : Container(
                            width: 153 * size,
                          ),
                    // _TextViewLeft() ,
                    Container(
                        margin: EdgeInsets.only(bottom: 80 * size),
                        child: Stack(alignment: Alignment.center, children: [
                          Card(
                              margin: EdgeInsets.zero,
                              color: colorlight,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(68),
                              ),
                              child: Container(
                                width: 55 * size,
                                height: 55 * size,
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  timeLineBloc.clearData();
                                  timeLineBloc.indexGraph = step;
                                  onSelect.text =
                                      controllerName.text.toString();
                                  timeLineBloc.isSaveForm = false;
                                  timeLineBloc.idForm = timeLineBloc
                                      .dataGraph3[step].id
                                      .toString();

                                  timeLineBloc.products = [];
                                  print(controllerName.text);
                                  switch (controllerName.text) {
                                    case "อาบน้ำ":
                                      {
                                        timeLineBloc.getShowerList();

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowerScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                      }
                                      break;
                                    case "ทานอาหาร":
                                      {
                                        timeLineBloc.getFoodList();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FoodScreen(
                                                  timeLineBloc.userId,
                                                  timeLineBloc)),
                                        );
                                      }
                                      break;
                                    case "ตรวจสุขภาพ":
                                      {
                                        timeLineBloc.getHealthList();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HealthScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                      }
                                      break;
                                    case "พลิกตัว":
                                      {
                                        timeLineBloc.getFlipList();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FlipScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                      }
                                      break;
                                    case "ทำกายภาพ":
                                      {
                                        timeLineBloc.getPhysicalList();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TherapyScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                      }
                                      break;
                                    case "ทำกิจกรรม":
                                      {
                                        timeLineBloc.getActivityList();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ActivityScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                      }
                                      break;
                                    case "ทำแผล":
                                      {
                                        timeLineBloc.getWoundList();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WoundScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                      }
                                      break;
                                    case "เช็ดตัว":
                                      {
                                        timeLineBloc.getWipeList();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WipeScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                      }
                                      break;
                                    case "ดูดเสมหะ":
                                      {
                                        timeLineBloc.getPhlegmList();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PhlegmScreen(
                                                        timeLineBloc.userId,
                                                        timeLineBloc)));
                                        break;
                                      }
                                    case "ให้ยา":
                                      {
                                        timeLineBloc.getDrugList();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MedicineScreen(
                                                      timeLineBloc.userId,
                                                      timeLineBloc)),
                                        );
                                      }
                                      break;
                                    default:
                                  }
                                });
                              },
                              child: Card(
                                  color: color,
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(68),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    width: 40 * size,
                                    height: 40 * size,
                                    child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: Colors.white,
                                        ),
                                        width: 10 * size,
                                        height: 10 * size,
                                        child: Image.asset(
                                          timeLineBloc
                                              .getIcon(controllerName.text),
                                          fit: BoxFit.contain,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container();
                                          },
                                        )),
                                  ))),
                        ])),
                    step % 2 != 0
                        ? _TextViewRight(context, setState, controller)
                        : Container(width: 153 * size),
                    //  _TextViewRight()
                  ])
            ]))
      ],
    );
  }

  Widget _TextViewLeft(context) {
    return Stack(
      children: [
        Row(children: [
          Stack(alignment: Alignment.center, children: [
            Card(
                margin: EdgeInsets.only(top: 30 * size),
                //   margin: EdgeInsets.zero,
                color: colorlight,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(68),
                ),
                child: Container(
                  width: 22 * size,
                  height: 22 * size,
                )),
            Container(
              margin: EdgeInsets.only(top: 30 * size),
              //  padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              width: 12 * size,
              height: 12 * size,
            ),
          ]),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      if (!isSave) {
                        calendarTimeView(
                            context, OnselestDate, setState, controller);
                      }
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: isSave ? Colors.white : Colors.grey,
                            width: 1,
                          ),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6.0),
                          )),
                      margin:
                          EdgeInsets.only(bottom: 10 * size, right: 40 * size),
                      child: Row(children: [
                        Icon(Icons.alarm, color: Colors.black, size: 15 * size),
                        Text(
                          controller.text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ]))),
              Container(
                  margin: EdgeInsets.only(top: 30 * size),
                  child: Stack(alignment: Alignment.centerLeft, children: [
                    Container(
                      width: 130 * size,
                      color: AppColor.colorGrayTextLight,
                      height: 1,
                    ),
                    Icon(Icons.arrow_right,
                        color: AppColor.colorGrayLight, size: 35 * size),
                  ])),
              isSave
                  ? Container(
                      padding: EdgeInsets.only(top: 80 * size, right: 0),
                      child: _textViewPrefix(controllerName))
                  : Container(
                      padding:
                          EdgeInsets.only(top: 80 * size, right: 15 * size),
                      child: _dropdownViewPrefix(timeLineBloc.dataAtivityGraph,
                          setState, controllerName))
            ],
          ),
        ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: status ? AppColor.colorGreenBg : Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(26.0),
                      )),
                  margin: EdgeInsets.only(
                    top: 100 * size,
                  ),
                  child: Row(children: [
                    Icon(Icons.check,
                        color: status ? AppColor.colorGreenChart : Colors.white,
                        size: 15 * size),
                    Text(
                      status ? "บันทึกแล้ว" : "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.colorGreenChart),
                    ),
                  ]))
            ]),
        Container(
            margin: EdgeInsets.only(top: 30 * size), child: _miniLeft(context))
      ],
    );
  }

  Widget _miniLeft(context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(left: 55 * size),
            child: Row(children: [
              Stack(alignment: Alignment.center, children: [
                Card(
                    margin: EdgeInsets.only(top: 70 * size),
                    //   margin: EdgeInsets.zero,
                    color: colorlight,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(68),
                    ),
                    child: Container(
                      width: 18 * size,
                      height: 18 * size,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 70 * size),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  width: 10 * size,
                  height: 10 * size,
                ),
              ]),
              InkWell(
                  onTap: () {
                    setState(() {
                      if (timeLineBloc.dataGraph3[step].minitime.text != "") {
                        timeLineBloc.clearData();
                        timeLineBloc.indexGraph = step;
                        onSelect.text = "ให้ยา";
                        timeLineBloc.idForm =
                            timeLineBloc.dataGraph3[step].id.toString();
                        timeLineBloc.isSaveForm = false;
                        timeLineBloc.medicineId =
                            timeLineBloc.dataGraph3[step].idMedicine.toString();

                        //  timeLineBloc.getDrugList();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedicineScreen(
                                    timeLineBloc.userId, timeLineBloc)));
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      isSave
                          ? InkWell(
                              onTap: () {
                                // setState(() {
                                //   calendarTimeView(
                                //       context, OnselestDate, setState, controller);
                                // });
                              },
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0),
                                      )),
                                  margin:
                                      EdgeInsets.only(top: 45 * size, right: 0),
                                  child: Row(children: [
                                    timeLineBloc.dataGraph3[step].minitime
                                                .text ==
                                            ""
                                        ? Container()
                                        : Icon(Icons.alarm,
                                            color: Colors.black, size: 10),
                                    Text(
                                      timeLineBloc
                                          .dataGraph3[step].minitime.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9),
                                    ),
                                  ])))
                          : Container(),
                      Container(
                          margin: EdgeInsets.only(top: 70 * size, left: 0),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Container(
                              width: 80 * size,
                              color: AppColor.colorGrayTextLight,
                              height: 1,
                            ),
                            Icon(Icons.arrow_right,
                                color: AppColor.colorGrayLight,
                                size: 30 * size),
                          ])),
                      Container(
                          padding: EdgeInsets.only(
                              top: 100 * size, right: 10 * size),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  timeLineBloc.dataGraph3[step].mininame.text !=
                                          ""
                                      ? Container(
                                          margin: EdgeInsets.only(right: 3),
                                          width: 10 * size,
                                          height: 10 * size,
                                          child: Image.asset(
                                            'assets/icon/ic_pills.png',
                                            fit: BoxFit.contain,
                                            color: AppColor.colorFont,
                                          ))
                                      : Container(),
                                  Text(
                                      timeLineBloc
                                          .dataGraph3[step].mininame.text,
                                      style: TextStyle(fontSize: 9)),
                                ],
                              ),
                              Text(
                                timeLineBloc.dataGraph3[step].minitype.text,
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                              )
                            ],
                          ))
                    ],
                  )),
            ])),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: status ? AppColor.colorGreenBg : Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(26.0),
                      )),
                  margin: EdgeInsets.only(top: 130 * size, left: 50 * size),
                  child: Row(children: [
                    Icon(Icons.check,
                        color: status ? AppColor.colorGreenChart : Colors.white,
                        size: 9),
                    Text(
                      timeLineBloc.dataGraph3[step].minitime.text == ""
                          ? ""
                          : status
                              ? "ทานแล้ว"
                              : "ยังไม่ได้ทาน",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                          color: status
                              ? AppColor.colorGreenChart
                              : AppColor.colorGrayTextNumber),
                    ),
                  ]))
            ]),
      ],
    );
  }

  OnselestDate(timeLineBloc) {
    // setState(() {
    // data1.date.text = DateHelper.convertTimeToDateApi(timeLineBloc);
    //  });
  }

  Widget _TextViewRight(context, setState, controller) {
    return Stack(children: [
      Row(
        children: [
          Container(
              margin: EdgeInsets.only(top: 30 * size),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        if (!isSave) {
                          calendarTimeView(
                              context, OnselestDate, setState, controller);
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: isSave ? Colors.white : Colors.grey,
                                width: 1,
                              ),
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6.0),
                              )),
                          margin: EdgeInsets.only(
                            bottom: 40 * size,
                          ),
                          child: Row(children: [
                            Icon(Icons.alarm, color: Colors.black, size: 10),
                            Text(
                              controller.text,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                          ]))),
                  Container(
                      child: Stack(alignment: Alignment.centerRight, children: [
                    Container(
                      width: 130 * size,
                      color: AppColor.colorGrayTextLight,
                      height: 1,
                    ),
                    Icon(Icons.arrow_left,
                        color: AppColor.colorGrayLight, size: 35 * size),
                  ])),
                  isSave
                      ? Container(
                          padding:
                              EdgeInsets.only(top: 40 * size, left: 30 * size),
                          child: _textViewPrefix(controllerName))
                      : Container(
                          padding:
                              EdgeInsets.only(top: 40 * size, left: 30 * size),
                          child: _dropdownViewPrefix(
                              timeLineBloc.dataAtivityGraph,
                              setState,
                              controllerName)),
                  // controllerName.text == ""
                  //     ? Container()
                  //     : Container(
                  //         padding: EdgeInsets.only(top: 45, left: 40),
                  //         child: _textViewPrefix(controllerName))
                ],
              )),
          Stack(alignment: Alignment.center, children: [
            Card(
                margin: EdgeInsets.only(top: 30 * size),
                color: colorlight,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(68),
                ),
                child: Container(
                  width: 22 * size,
                  height: 22 * size,
                )),
            Container(
              margin: EdgeInsets.only(top: 30 * size),
              //  padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              width: 12 * size,
              height: 12 * size,
            ),
          ]),
        ],
      ),
      Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: status ? AppColor.colorGreenBg : Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(26.0),
              )),
          margin: EdgeInsets.only(top: 100 * size, left: 60 * size),
          child: Row(children: [
            Icon(Icons.check,
                color: status ? AppColor.colorGreenChart : Colors.transparent,
                size: 15 * size),
            Text(
              status ? "บันทึกแล้ว" : "",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.colorGreenChart),
            ),
          ])),
      Container(margin: EdgeInsets.only(top: 35 * size), child: _mini(context))
    ]);
  }

  Widget _mini(context) {
    return Stack(children: [
      Row(
        children: [
          Container(
              margin: EdgeInsets.only(top: 60 * size),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (timeLineBloc.dataGraph3[step].minitime.text != "") {
                      timeLineBloc.clearData();
                      timeLineBloc.indexGraph = step;
                      onSelect.text = "ให้ยา";
                      timeLineBloc.medicineId =
                          timeLineBloc.dataGraph3[step].idMedicine.toString();
                      timeLineBloc.isSaveForm = false;
                      timeLineBloc.getDrugList();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicineScreen(
                                  timeLineBloc.userId, timeLineBloc)));
                    }
                  });
                },
                child: Stack(alignment: Alignment.center, children: [
                  isSave
                      ? InkWell(
                          onTap: () {
                            // if (!isSave) {
                            //   calendarTimeView(
                            //       context, OnselestDate, setState, controller);
                            // }
                          },
                          child: Container(
                              padding: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6.0),
                                  )),
                              margin: EdgeInsets.only(
                                  bottom: 20 * size, right: 30 * size),
                              child: Row(children: [
                                timeLineBloc.dataGraph3[step].minitime.text ==
                                        ""
                                    ? Container()
                                    : Icon(Icons.alarm,
                                        color: Colors.black, size: 9),
                                Text(
                                  timeLineBloc.dataGraph3[step].minitime.text,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 9),
                                ),
                              ])))
                      : Container(),
                  Container(
                      child: Stack(alignment: Alignment.centerRight, children: [
                    Container(
                      width: 90 * size,
                      color: AppColor.colorGrayTextLight,
                      height: 1,
                    ),
                    Icon(Icons.arrow_left,
                        color: AppColor.colorGrayLight, size: 30),
                  ])),
                  Container(
                      padding:
                          EdgeInsets.only(top: 35 * size, right: 30 * size),
                      child: Column(
                        children: [
                          Row(children: [
                            timeLineBloc.dataGraph3[step].mininame.text != ""
                                ? Container(
                                    margin: EdgeInsets.only(right: 3 * size),
                                    width: 10 * size,
                                    height: 10 * size,
                                    child: Image.asset(
                                      'assets/icon/ic_pills.png',
                                      fit: BoxFit.contain,
                                      color: AppColor.colorFont,
                                    ))
                                : Container(),
                            Text(
                              timeLineBloc.dataGraph3[step].mininame.text,
                              style: TextStyle(
                                fontSize: 9,
                              ),
                            )
                          ]),
                          Text(
                            timeLineBloc.dataGraph3[step].minitype.text,
                            style: TextStyle(
                              fontSize: 9,
                            ),
                          )
                        ],
                      ))
                ]),
              )),
          Stack(alignment: Alignment.center, children: [
            Card(
                margin: EdgeInsets.only(top: 60 * size),
                color: colorlight,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(68),
                ),
                child: Container(
                  width: 16 * size,
                  height: 16 * size,
                )),
            Container(
              margin: EdgeInsets.only(top: 60 * size),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              width: 10 * size,
              height: 10 * size,
            ),
          ]),
        ],
      ),
      Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: status ? AppColor.colorGreenBg : Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(26.0),
              )),
          margin: EdgeInsets.only(top: 120 * size, left: 60 * size),
          child: Row(children: [
            Icon(Icons.check,
                color: status ? AppColor.colorGreenChart : Colors.transparent,
                size: 11),
            Text(
              timeLineBloc.dataGraph3[step].minitime.text == ""
                  ? ""
                  : status
                      ? "ทานแล้ว"
                      : "ยังไม่ได้ทาน",
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: status
                      ? AppColor.colorGreenChart
                      : AppColor.colorGrayTextNumber),
            ),
          ])),
    ]);
  }

  Widget _textViewPrefix(controllerName) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              width: 100 * size,
              height: 30 * size,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  )),
              child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 2),
                  width: 95 * size,
                  child: Text(
                    controllerName.text,
                    style: TextStyle(fontSize: 10),
                  )))
        ]);
  }

  Widget _dropdownViewPrefix(timeLineBloc, setState, controller) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              width: 100 * size,
              height: 25 * size,
              // margin: const EdgeInsets.only(left: 20,top: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  )),
              child: Container(
                  margin: const EdgeInsets.only(left: 4, right: 2),
                  width: 95 * size,
                  child: DropdownButton<dropdownData>(
                    //  value: timeLineBloc[0],
                    iconSize: 24 * size,
                    hint: Text(
                        controller.text.isEmpty ? "กิจกรรม" : controller.text,
                        style: TextStyle(
                            color: controller.text.isEmpty
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 12)),
                    isExpanded: true,
                    icon: const Icon(Icons.expand_more_rounded),
                    iconEnabledColor: Colors.black,
                    underline: const SizedBox(),
                    onChanged: (newValue) {
                      setState(() {
                        controller.text = newValue!.name;
                        //  print(timeLineBloc.getIcon(controller.text).toString());
                      });
                    },
                    items: timeLineBloc.map<DropdownMenuItem<dropdownData>>(
                        (dropdownData value) {
                      return DropdownMenuItem<dropdownData>(
                        value: value,
                        child: Text(value.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                      );
                    }).toList(),
                  )))
        ]);
  }
}
