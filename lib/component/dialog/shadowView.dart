import 'package:flutter/material.dart';

class shadowView extends StatelessWidget {
  Widget view;
  double radius;
  double elevation;
  shadowView({
    Key? key,
    required this.view,
    required this.radius,
    required this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        color: Colors.transparent,
        elevation: elevation,
        shadowColor: const Color.fromARGB(105, 137, 171, 223),
        borderRadius: BorderRadius.circular(radius),
        child: Container(child: view));
  }
}