import 'package:flutter/material.dart';

import '../../theme/color.dart';

loadDialog(context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
                width: 30,
                height: 30,
                child: Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColor.colorFont),
                    ),
                    height: 30.0,
                    width: 30.0,
                  ),
                ))));
  }