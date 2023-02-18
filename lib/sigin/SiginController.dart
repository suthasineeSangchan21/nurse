import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/base_repository.dart';
import '../../../../component/dialog/popup.dart';
import '../../../../model/MainResponse.dart';
import '../../../../povider/login_repository.dart';
import '../component/dialog/loadDialog.dart';
import 'SuccesVerifyOTPPage.dart';

class SiginController {
  var dio = Dio();
  var position = ''.obs;
  var positionID = ''.obs;

  List<dynamic> positionList = [];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController employeeNoController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController telCOntroller = TextEditingController();

  RxnString errorText = RxnString(null);

  final LoginRepository _loginRepository =
      LoginRepository(BaseRepository.instance);

  void setDropdownValue(String value) {
    position.value = value;
  }

  void convertData(String positionName) {
    if (positionName == 'หัวหน้าพยาบาล') {
      positionID.value = '1';
    } else if (positionName == 'พยาบาล') {
      positionID.value = '2';
    } else {
      positionID.value = '3';
    }
  }

  void clearData() {
    emailController.clear();
    employeeNoController.clear();
    firstnameController.clear();
    lastnameController.clear();
    telCOntroller.clear();
  }

  void getPositionList() async {
    var response = await _loginRepository.getPositions();
    response.when(
        success: (List<String> data) {
          print(data.toString());
          positionList = data;
        },
        failure: (message) {},
        error: (error) {});
  }

  void validate() async {
    errorText.value = null;
  }

  signUP(String email, String firstName, String lastName, String phone,
      String positionID, context) async {
    loadDialog(context);
    var response = await _loginRepository.signUP(
        email, firstName, lastName, phone, positionID);
    response.when(success: (MainResponse data) {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => SuccesVerifyOTPPage(
                    email: email,
                  )));
    }, failure: (message) {
      Navigator.pop(context);
      popup(context, message.toString());
    }, error: (error) {
      Navigator.pop(context);
      popup(context, error.toString());
    });
  }

  bool validateEmail() {
    var emailValidate = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    return !emailValidate;
  }

  bool validateMobile() {
    return !(telCOntroller.text.isNotEmpty && (telCOntroller.text.length >= 9));
  }
}
