import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/color.dart';
import '../login/LoginPage.dart';

class SuccesVerifyOTPPage extends StatelessWidget {
  const SuccesVerifyOTPPage({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/bg.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    //  Get.to(LoginPage());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                           color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      // Text(
                      //   'ย้อนกลับ',
                      //   style: TextStyle(
                      //       color: AppColor.colorPrimary, fontSize: 18),
                      // )
                    ],
                  ),
                ),
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 60,
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Color.fromARGB(255, 102, 228, 106),
                          size: 60,
                        ),
                        const Text('สำเร็จ!'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'เราได้ส่ง Username และ Password ในการเข้าใช้งาน\nไปที่ $email แล้ว\nกรุณาตรวจสอบอีเมลของคุณ',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 40),
                      height: 40,
                      width: 240,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColor.colorFont,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              padding: const EdgeInsets.all(2)),
                          child: Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              )
            ]),
      ],
    ));
  }
}