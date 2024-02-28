

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Utils {
  static String getDateFormat(DateTime time) {
    StringBuffer sb = StringBuffer();
    sb.write(time.year.toString().padLeft(4,'0'));
    sb.write('-');
    sb.write(time.month.toString().padLeft(2,'0'));
    sb.write('-');
    sb.write(time.day.toString().padLeft(2,'0'));
    sb.write(' ');
    sb.write(time.hour.toString().padLeft(2,'0'));
    sb.write(':');
    sb.write(time.minute.toString().padLeft(2,'0'));
    sb.write(':');
    sb.write(time.second.toString().padLeft(2,'0'));
    return sb.toString();
  }

  static String convertDateTimeToMsgFormat(DateTime time) {
    StringBuffer sb = StringBuffer();
    int year = time.year - 2000;
    sb.write(year.toString().padLeft(2,'0'));
    sb.write(time.month.toString().padLeft(2,'0'));
    sb.write(time.day.toString().padLeft(2,'0'));
    sb.write(time.hour.toString().padLeft(2,'0'));
    sb.write(time.minute.toString().padLeft(2,'0'));
    sb.write(time.second.toString().padLeft(2,'0'));
    return sb.toString();
  }

  static DateTime stringToDateTime(String str) {
    List<int> timeList = List.generate(6, (index)=>0);
    String result = str.replaceAll(RegExp('\\s'), "");
    result = result.replaceAll(RegExp(':'), "");
    List<String> dList = result.split('');
    for(int i = 0; i < 6 ; i++) {
      int index = i*2;
      String str = dList[index] + dList[index+1];
      timeList[i] = int.parse(str);
    }
    return DateTime(2000+timeList[0], timeList[1], timeList[2], timeList[3], timeList[4], timeList[5]);
  }

  static bool checkReservation(String chargeTime, DateTime curTime) {
    DateTime startChargeTime = stringToDateTime(chargeTime);
    if(startChargeTime.isAfter(curTime)) {
      return true;
    }
    return false;
  }

  static String getHourFormat(int chargedSec) {
    int hour = (chargedSec / 3600).floor();
    String h = "00";
    if (hour < 10) {
      h = "0$hour";
    } else {
      h = hour.toString();
    }
    int min = ((chargedSec - hour * 3600) / 60).floor();
    String m = "00";
    if (min < 10) {
      m = "0$min";
    } else {
      m = min.toString();
    }
    int sec = chargedSec % 60;
    String s = "00";

    if (sec < 10) {
      s = "0$sec";
    } else {
      s = sec.toString();
    }

    return "$h:$m:$s";
  }

  static void logMsg(var log) {
    var logger = Logger(printer: PrettyPrinter(
        printTime: true,
        colors: true,
        printEmojis: true,
        methodCount: 2
    ));
    logger.d(log);
  }

  static double getHorizonSize(double percent, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // Utils.logMsg('csangbum getHorizonSize ${percent * width /100} width $width');
    return percent*width / 100;
  }

  static double getVerticalSize(double percent, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // Utils.logMsg('csangbum getHorizonSize ${percent*height /100}');
    return percent*height / 100;
  }
}