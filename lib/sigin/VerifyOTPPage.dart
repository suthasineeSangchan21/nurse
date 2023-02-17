import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/color.dart';
import 'SuccesVerifyOTPPage.dart';

class VerifyOTPPage extends StatelessWidget {
  const VerifyOTPPage({super.key});

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
            child: Container(
                height: MediaQuery.of(context).size.height * 0.53,
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
                              Icons.arrow_back_rounded,
                             color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'ย้อนกลับ',
                              style: TextStyle(
                                  color: AppColor.colorPrimary, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('ยืนยันตัวตน'),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.3,
                              color: Colors.blue,
                              child: const Center(
                                child: Text(
                                  'ส่งรหัส OTP ไปที่ +66 123456789',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const Text(
                              'กรุณากรอกเลข OTP ที่ส่งไปยังหมายเลขโทรศัพท์ของคุณ\nเพื่อทำการยืนยันตัวตน (REF : ABC123CD)',
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 70,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 70,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 70,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 70,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                //    Get.to(const SuccesVerifyOTPPage());
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SuccesVerifyOTPPage()),
                                  (route) => false,
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.15,
                                color: Colors.blue,
                                child: const Center(
                                  child: Text(
                                    'ยืนยัน OTP',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                )),
          )),
        ],
      ),
    );
  }
}