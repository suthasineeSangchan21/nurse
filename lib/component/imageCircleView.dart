import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../theme/color.dart';

class imageCircleView extends StatelessWidget {
  bool status;
  double size;
  double fontsize;
  String text;
  String subtitle;
  Uint8List? image;
  imageCircleView({
    Key? key,
    required this.status,
    required this.size,
    required this.text,
    required this.subtitle,
    required this.image,
    required this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            image != null
                ? Material(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    elevation: 3.0,
                    shadowColor: AppColor.colorGrayLight,
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child: ClipOval(
                          child: SizedBox(
                              width: size,
                              height: size,
                              child: Image.memory(
                                image!,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: size,
                                    height: size,
                                    color: Colors.white,
                                  );
                                },
                              ))),
                    ),
                  )
                : Material(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    elevation: 3.0,
                    shadowColor: AppColor.colorGrayLight,
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child: ClipOval(
                          child: SizedBox(
                        width: size,
                        height: size,
                      )),
                    ),
                  ),
          ],
        ),
        SizedBox(
          height: text == "" ? 0 : 3,
        ),
        text == ""
            ? Container()
            : Center(
                child: Text(
                text,
                style: TextStyle(
                    fontSize: fontsize,
                    color: status ? AppColor.colorFont : Colors.black),
              )),
        subtitle != ''
            ? Center(
                child: Text(
                subtitle,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.01,
                    color: status ? AppColor.colorFont : Colors.black),
              ))
            : Container()
      ],
    );
  }
}