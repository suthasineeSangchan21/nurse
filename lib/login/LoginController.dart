import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../api/base_repository.dart';
import '../../component/dialog/popup.dart';
import '../../model/MainResponse.dart';
import '../../povider/login_repository.dart';
import '../app/app_screen.dart';
import '../component/dialog/loadDialog.dart';
import '../helper/shared_preferences.dart';

class LoginController {
  var dio = Dio();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordCOntroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final LoginRepository _loginRepository =
      LoginRepository(BaseRepository.instance);
  bool validateEmail() {
    var emailValidate = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    return emailValidate;
  }

  checkAuth(context) {
    getAccessToken().then((value) => {
          if (value != "")
            {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AppScreen(0)),
                (route) => false,
              )
            }
        });
  }

  login({required String username, required String password, context}) async {
    loadDialog(context);
    var response = await _loginRepository.postLogin(
        password: password, username: username);
    response.when(success: (LoginResponse data) {
      saveAccessToken(data.accessToken!);
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AppScreen(0)),
        (route) => false,
      );
    }, failure: (message) {
      Navigator.pop(context);
      popup(context, "เข้าสู่ระบบไม่สำเร็จ");
    }, error: (error) {
      Navigator.pop(context);
      popup(context, "เข้าสู่ระบบไม่สำเร็จ");
    });
  }

  postForgetPassword(context) async {
    loadDialog(context);
    var response =
        await _loginRepository.postForgetPassword(emailController.text);
    response.when(success: (MainResponse data) {
      Navigator.pop(context);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => SendPasswordPage()),
      //   (route) => false,
      // );
    }, failure: (message) {
      Navigator.pop(context);
      popup(context, message);
    }, error: (error) {
      Navigator.pop(context);
      popup(context, error.toString());
    });
  }
}