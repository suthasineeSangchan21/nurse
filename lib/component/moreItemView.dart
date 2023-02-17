import 'package:flutter/material.dart';

import '../theme/color.dart';

class moreItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
         Material(
            borderRadius: const BorderRadius.all(Radius.circular(60.0)),
            elevation: 1.0,
            shadowColor: AppColor.colorGrayLight,
            child: Container(
              height: 20,
              width: 20.0,
              alignment: const FractionalOffset(0.0, 0.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.colorBgLight,
                  width: 12.0,
                ),
                shape: BoxShape.circle,
              ),
            )),
        // ignore: prefer_const_constructors
        Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 20,
        ),
      ],
    );
  }
}