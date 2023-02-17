import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/profileUserResponse.dart';
import '../theme/color.dart';
import 'dialog/shadowView.dart';
import 'imageCircleView.dart';

class cardProfileView extends StatelessWidget {
  ProfileUserResponse data;
  String position;
  Uint8List? image;
  cardProfileView(this.data, this.position, this.image);

  @override
  Widget build(BuildContext context) {
    return shadowView(
        radius: 25.0,
        elevation: 8,
        view: Card(
            color: AppColor.colorBgBlueLightBg,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColor.colorGrayBorder, width: 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(46),
                  topRight: Radius.circular(46),
                  //  bottomLeft: const Radius.circular(16),
                  bottomRight: Radius.circular(46)),
            ),
            child: Container(
                margin: EdgeInsets.all(6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(
                      //   width: 10,
                      // ),
                      imageCircleView(
                        size: 60,
                        status: true,
                        text: position,
                        subtitle: '',
                        fontsize: 10,
                        image: image,
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Text('Hi, Sirisorn ',
                                  style: TextStyle(
                                      color: AppColor.colorFont, fontSize: 16)),
                              SvgPicture.asset(
                                "assets/icon/hand.svg",
                                fit: BoxFit.contain,
                                color: AppColor.colorFont,
                                width: 20,
                              ),
                            ],
                          ),
                          Text(
                            data.firstName.toString() +
                                " " +
                                data.lastName.toString(),
                          ),
                          Text(data.username.toString(),
                              style: TextStyle(
                                  color: AppColor.colorGrayText, fontSize: 14)),
                          Row(children: [
                            Icon(
                              Icons.call,
                              color: AppColor.colorGrayText,
                              size: 15,
                            ),
                            Text(data.phone.toString(),
                                style: TextStyle(
                                    color: AppColor.colorGrayText,
                                    fontSize: 12))
                          ]),
                        ],
                      )
                      // textThreeLineView(
                      //   fontSize: MediaQuery.of(context).size.width * 0.01,
                      //   isLeft: false,
                      //   txt1: data.firstName.toString() +
                      //       " " +
                      //       data.lastName.toString(),
                      //   txt2: data.username.toString(),
                      //   txt3: " " + data.phone.toString(),
                      // )
                    ]))));
  }
}