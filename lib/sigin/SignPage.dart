import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color.dart';
import '../helper/DateHelper.dart';
import 'SiginController.dart';

class SignPage extends StatefulWidget {
  SignPage();
  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  var siginController = SiginController();
  final GlobalKey formKey = GlobalKey();
  bool isCheck = false;
  String dateNow() {
    var now = DateTime.now();
    return DateHelper.convertStringCalendarToDayAndTimeWithFormat(now) ?? "";
  }

  @override
  void initState() {
    siginController.clearData();
    siginController.getPositionList();
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
          SafeArea(
            child: SingleChildScrollView(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.colorPrimary,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            // Text(
                            //   'ย้อนกลับ',
                            //   style: TextStyle(
                            //       color: AppColor.colorPrimary, fontSize: 14),
                            // )
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: 50,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'สร้างบัญชีผู้ใช้งาน',
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _buildField(
                                context,
                                'รหัสพนักงาน',
                                siginController.employeeNoController,
                                false,
                                false),
                            _buildDropdownPosition(context, 'ตำแหน่ง'),
                            _buildField(
                                context,
                                'ชื่อ',
                                siginController.firstnameController,
                                true,
                                siginController.firstnameController.text ==
                                        "" &&
                                    isCheck),
                            // _buildField(
                            //     context,
                            //     'นามสกุล',
                            //     siginController.lastnameController,
                            //     true,
                            //     siginController.lastnameController.text == "" &&
                            //         isCheck),
                            _buildField(
                                context,
                                'อีเมล',
                                siginController.emailController,
                                true,
                                siginController.validateEmail() && isCheck),
                            _buildField(
                                context,
                                'หมายเลขโทรศัพท์',
                                siginController.telCOntroller,
                                true,
                                siginController.validateMobile() && isCheck),

                            Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 40,
                                width: 200,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isCheck = true;
                                      });

                                      if (siginController
                                                  .emailController.text !=
                                              "" &&
                                          siginController
                                                  .firstnameController.text !=
                                              "" &&
                                          // siginController
                                          //         .lastnameController.text !=
                                          //     "" &&
                                          siginController.telCOntroller.text !=
                                              "" &&
                                          siginController.positionID.value !=
                                              "" &&
                                          !siginController.validateEmail() &&
                                          !siginController.validateMobile()) {
                                        siginController.signUP(
                                            siginController
                                                .emailController.text,
                                            siginController
                                                .firstnameController.text,
                                            siginController
                                                .lastnameController.text,
                                            siginController.telCOntroller.text,
                                            siginController.positionID.value,
                                            context);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: AppColor.colorFont,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        padding: const EdgeInsets.all(2)),
                                    child: Text(
                                      'ถัดไป',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                          ],
                        )
                      ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(BuildContext context, String title,
      TextEditingController controller, bool isRequired, bool check) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            isRequired
                ? const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                : Container(),
            Text(title),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: 300,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                    color: isCheck && controller.text == ""
                        ? Colors.red
                        : AppColor.colorBlueBorder)),
            child: TextFormField(
              style: const TextStyle(fontSize: 12),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              maxLength: title == "หมายเลขโทรศัพท์" ? 10 : 100,
              decoration: InputDecoration(
                counterText: "",
                hintText: title == "หมายเลขโทรศัพท์"
                    ? "+66"
                    : title == "อีเมล"
                        ? "Email"
                        : title,
                isDense: true,
                focusColor: Colors.black,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              validator: (value) {
                if (GetUtils.isNullOrBlank(value)!) {
                  return 'กรุณากรอกข้อมูล';
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownPosition(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            Text(title),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: 300,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                    color: isCheck && siginController.position.value == 'F'
                        ? Colors.red
                        : AppColor.colorBlueBorder)),
            child: Obx(
              () => DropdownButtonFormField(
                validator: (value) {
                  if (GetUtils.isNullOrBlank(value)!) {
                    return 'กรุณากรอกข้อมูล';
                  } else {
                    return null;
                  }
                },
                hint: const Text('ระบุตำแหน่ง'),
                value: siginController.position.value == ''
                    ? null
                    : siginController.position.value,
                isExpanded: false,
                items: const [
                  DropdownMenuItem(
                      value: 'หัวหน้าพยาบาล', child: Text('หัวหน้าพยาบาล')),
                  DropdownMenuItem(value: 'พยาบาล', child: Text('พยาบาล')),
                  DropdownMenuItem(
                      value: 'พนักงานทั่วไป', child: Text('พนักงานทั่วไป')),
                ],
                onChanged: (position) {
                  siginController.setDropdownValue(position.toString());
                  siginController.convertData(position.toString());
                },
                isDense: true,
                decoration: InputDecoration(
                  isDense: true,
                  focusColor: Colors.black,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}