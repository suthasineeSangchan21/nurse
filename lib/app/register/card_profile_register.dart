import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../component/imageCircleView.dart';
import '../../model/PatientDataResponse.dart';
import '../../model/patienResponse.dart';
import '../../model/personalResponse.dart';
import '../../model/sickResponse.dart';
import '../../theme/color.dart';
import 'package:http/http.dart' as http;

class cardProfileRegisterView extends StatelessWidget {
  PatientResponse data;
  Uint8List img;
  PersonalResponse personalData;
  cardProfileRegisterView(this.data, this.img, this.personalData);

  @override
  Widget build(BuildContext context) {
    //getImg();
    return _cardProfileView(context);
  }

  Widget _cardProfileView(context) {
    return Padding(
        padding: const EdgeInsets.all(6),
        child: Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: imageCircleView(
                      size: 80,
                      fontsize: MediaQuery.of(context).size.width * 0.015,
                      status: false,
                      text: data.firstName.toString(),
                      subtitle: "",
                      image: img)),
              _dataProfileView()
            ])));
  }

  Widget _dataProfileView() {
    return Padding(
        padding: const EdgeInsets.all(7),
        child: Card(
            color: AppColor.colorBgBlueLightBg,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      data.hn.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.colorPrimaryLight,
                          fontWeight: FontWeight.bold),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textProfileView('คำนำหน้า', data.title.toString()),
                    _textProfileView('ชื่อ', data.firstName.toString()),
                    _textProfileView('นามสกุล', data.lastName.toString()),
                    _textProfileView('ชื่อเล่น', data.nickName.toString()),
                    _textProfileView('อายุ', data.age.toString() + " ปี"),
                    _textProfileView('เพศ', data.gender.toString()),
                    _textProfileView('โรคประจำตัว', "-"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textProfileView('ประวัติแพ้ยา', '-'),
                    _textProfileView('กรุ๊ปเลือด', data.bloodType.toString()),
                    _textProfileView('สูบบุหรี่',
                        personalData.isSmoke == "true" ? "ใช่" : "ไม่มี"),
                    _textProfileView('ดื่มแอลกอฮอล์',
                        personalData.isDrink == "true" ? "ใช่" : "ไม่มี"),
                  ],
                )
              ],
            )));
  }

  Widget _textProfileView(title, subtitle) {
    return Container(
        // width: 100,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                child: Text(
              title,
              style: TextStyle(fontSize: 11, color: Colors.black),
            )),
            Container(
                //   width: 60,
                child: Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: AppColor.colorPrimaryLight),
            )),
          ],
        ));
  }
}
