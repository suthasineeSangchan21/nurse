import 'package:flutter/material.dart';

popup(context, String txt, {btTxt, fn}) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(txt),
            // actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              TextButton(
                onPressed: () => fn == null
                    ? Navigator.pop(
                        context,
                      )
                    : fn(),
                child: Text(
                  btTxt == "" ? btTxt : "ยกเลิก",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ],
          ));
}