import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/color.dart';
import 'ForgetPasswordPage.dart';
import 'LoginController.dart';

class LoginPage extends StatefulWidget {
  LoginPage();
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginController = LoginController();

  bool isCheck = false;
  @override
  void initState() {
    loginController.checkAuth(context);
    super.initState();
  }

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
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('ยินดีต้อนรับ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26),
                                border: Border.all(
                                    color: isCheck &&
                                            loginController
                                                    .usernameController.text ==
                                                ""
                                        ? Colors.red
                                        : AppColor.colorBlueBorder)),
                            child: TextFormField(
                              controller: loginController.usernameController,
                              decoration: const InputDecoration(
                                // fillColor: Colors.white,
                                // filled: true,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                hintText: 'username@email.com',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                prefixIconColor: Colors.grey,
                                focusColor: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(
                                        color: isCheck &&
                                                loginController
                                                        .passwordCOntroller
                                                        .text ==
                                                    ""
                                            ? Colors.red
                                            : AppColor.colorBlueBorder)),
                                child: TextFormField(
                                  obscureText: true,
                                  controller:
                                      loginController.passwordCOntroller,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    hintText: 'รหัสผ่าน',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ForgetPasswordPage()));
                                },
                                child: const Text(
                                  'ลืมรหัสผ่าน?',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 0),
                              height: 40,
                              width: 240,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isCheck = true;
                                    });
                                    if (loginController
                                                .usernameController.text !=
                                            "" &&
                                        loginController
                                                .passwordCOntroller.text !=
                                            "") {
                                      loginController.login(
                                          username: loginController
                                              .usernameController.text,
                                          password: loginController
                                              .passwordCOntroller.text,
                                          context: context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: AppColor.colorFont,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                      padding: const EdgeInsets.all(2)),
                                  child: Text(
                                    'เข้าสู่ระบบ',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                          SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       width: 100,
                          //       height: 2,
                          //       color: Colors.grey,
                          //     ),
                          //     Container(
                          //       margin: EdgeInsets.only(left: 5, right: 5),
                          //       //  color: AppColor.colorBg,
                          //       width: 40,
                          //       height: 20,
                          //       //  padding: EdgeInsets.symmetric(horizontal: 20),
                          //       child: Text(
                          //         'หรือ',
                          //         textAlign: TextAlign.center,
                          //         style: TextStyle(color: Colors.grey),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 100,
                          //       height: 2,
                          //       color: Colors.grey,
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Container(
                          //     margin: EdgeInsets.only(right: 0),
                          //     height: 40,
                          //     width: 240,
                          //     child: ElevatedButton(
                          //         onPressed: () {
                          //           Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (_) => SignPage()));
                          //         },
                          //         style: ElevatedButton.styleFrom(
                          //             primary: AppColor.colorGrayButton,
                          //             shape: RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(26)),
                          //             padding: const EdgeInsets.all(2)),
                          //         child: Text(
                          //           'ลงทะเบียนใหม่',
                          //           style: TextStyle(color: AppColor.colorFont),
                          //         ))),
                        ],
                      ),
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}