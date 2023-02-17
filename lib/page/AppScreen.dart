import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurse_app/theme/color.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../home/HomePage.dart';
import '../patient/PatientPage.dart';
import '../profile/ProfileScreen.dart';


class AppScreen extends StatefulWidget {
  int index = 1;
  AppScreen(this.index);
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppScreen> {
  bool isShowError = false;
  late PersistentTabController _controller;
  bool isoffline = false;
  bool isHide = false;
  bool isStartInternet = false;
  bool isVerify = false;
  int _currentIndex = 0;
  List<Widget> _buildScreens() {
    return [
      HomePage(),
      Container(),
      PatientPage(),
      Container(),
      ProfileScreen()
    ];
  }

  final interval = const Duration(seconds: 1);
  int timerMaxSeconds = 5;

  startTimeout() {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          setState(() {
            isHide = true;
          });
        }
      });
    });
  }

  @override
  void initState() {
    // saveAccessToken("");
    if (widget.index != null) {
      _controller = PersistentTabController(initialIndex: widget.index);
    } else {
      _controller = new PersistentTabController(initialIndex: 0);
    }

    super.initState();
  }

  _onItemTapped(int index) {
    _controller.jumpToTab(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,

        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //         height: MediaQuery.of(context).size.height,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             InkWell(
      //                 onTap: () {
      //                   _onItemTapped(2);
      //                 },
      //                 child: Stack(alignment: Alignment.center, children: [
      //                   Icon(Icons.circle, color: Colors.white, size: 75),
      //                   Icon(
      //                     Icons.qr_code,
      //                     size: 40,
      //                     color: _currentIndex == 2
      //                         ? AppColor.colorFont
      //                         : Colors.grey,
      //                   ),
      //                   Container(
      //                     margin: EdgeInsets.only(top: 55),
      //                       width: 70,
      //                       child: Text("สแกน",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               color: _currentIndex == 2
      //                                   ? AppColor.colorFont
      //                                   : Colors.grey,
      //                               fontSize: 12))),
      //                 ])),
      //             SizedBox(
      //               height:MediaQuery.of(context).size.height* 0.025,
      //             )
      //           ],
      //         ))
      //   ],
      // )
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: 25,
        ),
        title: "หน้าหลัก",
        activeColorPrimary: AppColor.colorFont,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: Column(
          children: [
            SvgPicture.asset(
              "assets/icon/design.svg",
              fit: BoxFit.contain,
              color: Colors.grey,
              width: 30,
            ),
            Text(
              "ตารางงาน",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
        icon: Column(
          children: [
            SvgPicture.asset(
              "assets/icon/design.svg",
              fit: BoxFit.contain,
              color: AppColor.colorFont,
              width: 30,
            ),
            Text("ตารางงาน",
                style: TextStyle(color: AppColor.colorFont, fontSize: 12)),
          ],
        ),
        activeColorPrimary: AppColor.colorFont,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
            height: 30,
            width: 30,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.qr_code,
                  size: 26,
                  color: AppColor.colorFont,
                ),
                Text("สแกน",
                    style: TextStyle(color: AppColor.colorFont, fontSize: 9)),
              ],
            )),
        title: " ",
        textStyle: TextStyle(color: AppColor.colorFont, fontSize: 12),
        activeColorPrimary:
            _currentIndex == 2 ? AppColor.colorFont : Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.notifications,
          size: 30,
        ),
        title: "แจ้งเตือน",
        activeColorPrimary: AppColor.colorFont,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
          size: 30,
        ),
        title: "Profile",
        activeColorPrimary: AppColor.colorFont,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  loadDialog(String title) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
                width: 30,
                height: 30,
                child: Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    height: 30.0,
                    width: 30.0,
                  ),
                ))));
  }
}