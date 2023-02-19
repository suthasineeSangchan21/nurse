import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nurse_app/component/dialog/normalDialog.dart';

import '../../theme/color.dart';
import '../helper/shared_preferences.dart';
import '../login/LoginPage.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorBgLight,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
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