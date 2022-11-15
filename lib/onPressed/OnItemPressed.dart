import 'package:ff_frontline/MainBody.dart';
import 'package:ff_frontline/calendar/MainCalendar.dart';
import 'package:ff_frontline/frontline/OnsalHakair.dart';
import 'package:ff_frontline/frontline/SealRock.dart';
import 'package:ff_frontline/frontline/TheBorderlandRuins.dart';
import 'package:ff_frontline/frontline/TheFieldsOfGlory.dart';
import 'package:ff_frontline/main.dart';
import 'package:flutter/material.dart';

void onItemPressed(BuildContext context, {required int index}) {
  Navigator.pop(context);

  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp(bodyWidget: TheFieldsOfGlory())));
      break;
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp(bodyWidget: OnsalHakair())));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp(bodyWidget: TheBorderlandRuins())));
      break;
    case 3:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp(bodyWidget: SealRock())));
      break;
    case 4:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp(bodyWidget: MainBody())));
      break;
    case 5:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp(bodyWidget: MainCalendar())));
      break;
  }
}