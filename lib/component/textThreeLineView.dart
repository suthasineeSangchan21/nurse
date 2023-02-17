import 'package:flutter/material.dart';

import '../theme/color.dart';

class textThreeLineView extends StatelessWidget {
  bool isLeft;
  String txt1;
  String txt2;
  String txt3;
  double fontSize;
  textThreeLineView({
    Key? key,
    required this.isLeft,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text(
                txt1,
                style: TextStyle(
                    color: isLeft ? AppColor.colorGrayText : Colors.black,
                    fontSize: fontSize),
              ),
              Container(
                  width: 100,
                  child: Text(
                    txt2,
                    maxLines: 1,
                    style:
                        TextStyle(color: AppColor.colorGrayText, fontSize: 12),
                  )),
              Row(
                children: [
                  isLeft
                      ? Container()
                      // ignore: prefer_const_constructors
                      : Icon(
                          Icons.phone,
                          color: AppColor.colorGrayText,
                          size: 9,
                        ),
                  Text(
                    txt3,
                    style: TextStyle(
                        color: AppColor.colorGrayText, fontSize: fontSize),
                  ),
                ],
              )
            ]));
  }
}