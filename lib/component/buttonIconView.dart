import 'package:flutter/material.dart';

import '../theme/color.dart';

class buttonIconView extends StatelessWidget {
  IconData icon;
  double border;
  String text;
  Color color;
  buttonIconView({
    Key? key,
    required this.icon,
    required this.border,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border)),
          padding: const EdgeInsets.all(2)),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
        MediaQuery.of(context).size.width > 800
            ? Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center)
            : Container()
      ]),
    );
  }
}