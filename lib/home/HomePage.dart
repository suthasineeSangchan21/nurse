import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../../helper/getImg.dart';
import '../../model/profileUserResponse.dart';
import '../../theme/color.dart';
import '../component/cardProfileView.dart';
import '../helper/DateHelper.dart';
import 'HomeBloc.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeBloc = HomeBloc();

  bool isCheck = false;
  @override
  void initState() {
    homeBloc.getprofileUser();
    getProfileImg(_getDataPathSubject);
    super.initState();
  }

  final BehaviorSubject<Uint8List> _getDataPathSubject =
      BehaviorSubject<Uint8List>();
  BehaviorSubject<Uint8List> get getDataPathSubject => _getDataPathSubject;
  late Uint8List img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg_home.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
              child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 40,
                                )
                              ])
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                          width: 320,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: StreamBuilder<ProfileUserResponse>(
                              stream: homeBloc.profilePathSubject.stream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  // return cardProfileView(
                                  //   snapshot.data!,
                                  //   homeBloc.convertData(
                                  //       snapshot.data!.positionId.toString()),
                                  // );
                                  return StreamBuilder<Uint8List>(
                                      stream: _getDataPathSubject.stream,
                                      builder: (context, data) {
                                        if (data.hasData) {
                                          return cardProfileView(
                                              snapshot.data!,
                                              homeBloc.convertData(snapshot
                                                  .data!.positionId
                                                  .toString()),
                                              data.data!);
                                        } else {
                                          return Container();
                                        }
                                      });
                                } else {
                                  return Container();
                                }
                              })),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Text("Today's work ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 76, 76, 76),
                                    fontSize: 18))
                          ]),
                      weekItemView(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      _searchview(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            bt1(),
                            SizedBox(
                              width: 20,
                            ),
                            bt2()
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            bt3(),
                            SizedBox(
                              width: 20,
                            ),
                            bt4()
                          ])
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  weekItemView() {
    return Padding(
        padding: EdgeInsets.only(
            left: 25,
            right: 25,
            top: MediaQuery.of(context).size.height * 0.01),
        child: Row(
          children: [
            dayItemView(false, DateTime.now().subtract(Duration(days: 3))),
            dayItemView(false, DateTime.now().subtract(Duration(days: 2))),
            dayItemView(false, DateTime.now().subtract(Duration(days: 1))),
            Card(
                elevation: 3,
                color: AppColor.colorBgBlueLightBt,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: dayItemView(true, DateTime.now()))),
            dayItemView(false, DateTime.now().add(const Duration(days: 1))),
            dayItemView(false, DateTime.now().add(const Duration(days: 2))),
            dayItemView(false, DateTime.now().add(const Duration(days: 3))),
          ],
        ));
  }

  dayItemView(isToday, DateTime day) {
    return Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Text(DateHelper.convertDateCalendarToMouth(day),
                style: TextStyle(
                    color: isToday
                        ? AppColor.colorFont
                        : Color.fromARGB(255, 155, 155, 155),
                    fontSize: 12)),
            Text(DateHelper.convertDateCalendarToDate(day),
                style: TextStyle(
                    color: isToday
                        ? Color.fromARGB(255, 76, 76, 76)
                        : Color.fromARGB(255, 155, 155, 155),
                    fontSize: 22,
                    fontWeight: isToday ? FontWeight.w500 : FontWeight.normal)),
            Text(DateHelper.convertDateCalendarToDay(day),
                style: TextStyle(
                    color: isToday
                        ? AppColor.colorFont
                        : Color.fromARGB(255, 155, 155, 155),
                    fontSize: 12)),
          ],
        ));
  }

  bt1() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/bg1.png',
          width: MediaQuery.of(context).size.height * 0.15,
          height: MediaQuery.of(context).size.height * 0.15,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 50,
            ),
            Text("ตารางงาน",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.022))
          ],
        )
      ],
    );
  }

  bt2() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/bg2.png',
          width: MediaQuery.of(context).size.height * 0.15,
          height: MediaQuery.of(context).size.height * 0.15,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/megaphone.png',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            Text("ประกาศ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.022))
          ],
        )
      ],
    );
  }

  bt3() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/bg3.png',
          width: MediaQuery.of(context).size.height * 0.15,
          height: MediaQuery.of(context).size.height * 0.15,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/piechart.png',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            Text("ภาพรวม",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.022))
          ],
        )
      ],
    );
  }

  bt4() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/bg4.png',
          width: MediaQuery.of(context).size.height * 0.15,
          height: MediaQuery.of(context).size.height * 0.15,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/wechat.png',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            Text("แชท",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.022))
          ],
        )
      ],
    );
  }

  TextEditingController searchController = TextEditingController();
  Widget _searchview() {
    return Container(
        height: 35,
        width: 330,
        // ignore: prefer_const_constructors
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            elevation: 2.0,
            shadowColor: Colors.white,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  labelText: "ค้นหา",
                  hintText: "ค้นหา",
                  labelStyle:
                      TextStyle(fontSize: 14.0, color: AppColor.colorGrayLight),
                  hintStyle:
                      TextStyle(fontSize: 14.0, color: AppColor.colorGrayLight),
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.colorGrayLight,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            )));
  }
}