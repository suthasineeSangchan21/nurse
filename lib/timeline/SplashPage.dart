import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../app/app_screen.dart';
import '../helper/shared_preferences.dart';
import '../login/LoginController.dart';
import '../login/LoginPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var loginController = LoginController();

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  checkAuth() {
    Future.delayed(Duration(seconds: 2), () {
      getAccessToken().then((value) => {
            if (value != "")
              {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AppScreen(0)),
                  (route) => false,
                )
              }
            else
              {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginPage();
                  },
                ), (_) => false)
              }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/bg.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 120,
                      width: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // _loadWidget() async {
  //   //   var _duration = Duration(seconds: 20);
  //   // return Timer(_duration, checkLogin(context));
  //   Future.delayed(Duration(seconds: 4), () {
  //     checkLogin(context);
  //   });
  // }
}
