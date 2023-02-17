import 'package:flutter/material.dart';

import '../../theme/color.dart';

NormalDialog(context, String txt, Function fn) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(txt),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'ยกเลิก',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () => {Navigator.pop(context), fn()},
                child: const Text(
                  'ตกลง',
                  style: TextStyle(color: AppColor.colorFont, fontSize: 16),
                ),
              ),
            ],
          ));
}

Normal1ButtonDialog(context, String txt, Function fn) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(txt),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => {
                  Navigator.of(context, rootNavigator: true).pop('dialog'),
                  fn()
                },
                child: const Text(
                  'ถัดไป',
                  style: TextStyle(color: AppColor.colorFont, fontSize: 16),
                ),
              ),
            ],
          ));
}