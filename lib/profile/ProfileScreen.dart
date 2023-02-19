import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurse_app/component/dialog/normalDialog.dart';
import 'package:rxdart/rxdart.dart';

import '../../theme/color.dart';
import '../component/imageCircleView.dart';
import '../helper/getImg.dart';
import '../helper/shared_preferences.dart';
import '../home/HomeBloc.dart';
import '../login/LoginPage.dart';
import '../model/profileUserResponse.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    homeBloc.getprofileUser();
    getProfileImg(_getDataPathSubject);
    super.initState();
  }

  String convertData(value) {
    if (value == 1) {
      return 'หัวหน้าพยาบาล';
    } else if (value == 2) {
      return 'พยาบาล';
    } else {
      return 'พนักงานทั่วไป';
    }
  }

  final BehaviorSubject<Uint8List> _getDataPathSubject =
      BehaviorSubject<Uint8List>();
  BehaviorSubject<Uint8List> get getDataPathSubject => _getDataPathSubject;
  late Uint8List img;

  @override
  void dispose() {
    super.dispose();
  }

  var homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorBgLight,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                child: StreamBuilder<ProfileUserResponse>(
                    stream: homeBloc.profilePathSubject.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Color.fromARGB(255, 55, 94, 234),
                                          Color.fromARGB(255, 75, 110, 236),
                                          Color.fromARGB(255, 153, 168, 242)
                                        ]),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Text(
                                          "Profile",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              StreamBuilder<Uint8List>(
                                                  stream: _getDataPathSubject
                                                      .stream,
                                                  builder: (context, data) {
                                                    if (data.hasData) {
                                                      return Container(
                                                        // margin: EdgeInsets.all(6),
                                                        child: imageCircleView(
                                                          size: 90,
                                                          status: true,
                                                          text: '',
                                                          subtitle: '',
                                                          fontsize: 10,
                                                          image: data.data,
                                                        ),
                                                        // SizedBox(
                                                        //   width: 10,
                                                        // ),
                                                      );
                                                    } else {
                                                      return Container();
                                                    }
                                                  }),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      snapshot.data!.firstName
                                                              .toString() +
                                                          " " +
                                                          snapshot
                                                              .data!.lastName
                                                              .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16)),
                                                  Text(
                                                      snapshot.data!.username
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14)),
                                                  Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/icon/ic_nurse.png',
                                                              width: 25,
                                                              height: 35,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Text(
                                                                " " +
                                                                    convertData(snapshot
                                                                            .data!
                                                                            .positionId)
                                                                        .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14)),
                                                          ],
                                                        )
                                                      ]),
                                                ],
                                              ),
                                            ])
                                      ])),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.person,
                                          color: AppColor.colorBlueLightIcon,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'ชื่อผู้ใช้',
                                          style: TextStyle(
                                              color:
                                                  AppColor.colorBlueLightIcon,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: Text(
                                          snapshot.data!.firstName.toString() +
                                              "  " +
                                              snapshot.data!.lastName
                                                  .toString(),
                                          style: TextStyle(
                                              color: AppColor.colorBlack,
                                              fontSize: 16)),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height: 0.1,
                                      color: Color.fromARGB(255, 37, 39, 70),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(Icons.mail,
                                                color: AppColor
                                                    .colorBlueLightIcon),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'อีเมล',
                                              style: TextStyle(
                                                  color: AppColor
                                                      .colorBlueLightIcon,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.0, vertical: 10),
                                          child: Text(
                                            snapshot.data!.username.toString(),
                                            style: TextStyle(
                                                color: AppColor.colorBlack,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height: 0.1,
                                      color: Color.fromARGB(255, 37, 39, 70),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(Icons.call,
                                                color: AppColor
                                                    .colorBlueLightIcon),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'หมายเลขโทรศัพท์',
                                              style: TextStyle(
                                                  color: AppColor
                                                      .colorBlueLightIcon,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.0, vertical: 10),
                                          child: Text(
                                            snapshot.data!.phone.toString(),
                                            style: TextStyle(
                                                color: AppColor.colorBlack,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height: 0.1,
                                      color: Color.fromARGB(255, 37, 39, 70),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(Icons.people,
                                                    color: AppColor
                                                        .colorBlueLightIcon),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'username',
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .colorBlueLightIcon,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.0,
                                                  vertical: 10),
                                              child: Text(
                                                snapshot.data!.username
                                                    .toString(),
                                                style: TextStyle(
                                                    color: AppColor.colorBlack,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   width: 2,
                                        // ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: const [
                                                  Icon(Icons.key,
                                                      color: AppColor
                                                          .colorBlueLightIcon),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'password',
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .colorBlueLightIcon,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30.0,
                                                    vertical: 15),
                                                child: Text(
                                                  '■ ■ ■ ■ ■ ■',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColor.colorBlack,
                                                      fontSize: 6),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height: 0.1,
                                      color: Color.fromARGB(255, 37, 39, 70),
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                      } else {
                        return Container();
                      }
                    })),
            SizedBox(
              height: 30,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        NormalDialog(
                            context,
                            'คุณต้องการออกจากระบบ?',
                            () => {
                                  saveAccessToken(''),
                                  Navigator.of(context, rootNavigator: true)
                                      .pushAndRemoveUntil(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return LoginPage();
                                    },
                                  ), (_) => false),
                                  // Navigator.pop(context)
                                });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                AppColor.colorPurpleBt,
                                AppColor.colorBlueBt,
                              ]),
                        ),
                        child: Text(
                          "ออกจากระบบ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ))
                ]),
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "เวอร์ชั่น 1.0.0 (10)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )
                ]),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
