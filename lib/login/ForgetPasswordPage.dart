import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/color.dart';
import 'LoginController.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage();
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  var loginController = LoginController();
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.colorPrimary,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 30,
                      // ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 60,
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('ลืมรหัสผ่าน',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              'กรุณากรอกอีเมลเพื่อคุณจะได้รับลิ้งค์\nเพื่อสร้างรหัสผ่านใหม่ทางอีเมล',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26),
                                border: Border.all(
                                    color: isCheck &&
                                            loginController
                                                    .emailController.text ==
                                                ""
                                        ? Colors.red
                                        : Colors.grey)),
                            child: TextFormField(
                              controller: loginController.emailController,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: 'อีเมล', border: InputBorder.none),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 40),
                              width: 250,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isCheck = true;
                                    });
                                    if (loginController.emailController.text !=
                                            "" &&
                                        loginController.validateEmail()) {
                                      loginController
                                          .postForgetPassword(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: AppColor.colorFont,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      padding: const EdgeInsets.all(2)),
                                  child: Text(
                                    'ส่งรหัสผ่าน',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}