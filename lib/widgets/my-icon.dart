import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIcon extends StatefulWidget {
  const MyIcon({Key? key}) : super(key: key);

  @override
  State<MyIcon> createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  List<Icon> icons = [
    const Icon(Icons.ac_unit_rounded),
    const Icon(Icons.access_alarms),
    const Icon(Icons.cabin),
    const Icon(Icons.calculate),
    const Icon(Icons.construction_sharp),
    const Icon(Icons.connecting_airports_sharp),
    const Icon(Icons.contacts_sharp),
    const Icon(Icons.school),
    const Icon(Icons.face),
    const Icon(Icons.accessibility_rounded)
  ];
  int rand = Random().nextInt(9);
  Color color = getRandomPastelColor();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: color,
          child: icons[rand],
        ),
      ),
    );
  }
}

Color getRandomPastelColor() {
  Random random = Random();
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);
  int alpha = 150 + random.nextInt(100);
  return Color.fromARGB(alpha, red, green, blue);
}
