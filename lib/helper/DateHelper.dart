import 'package:easy_localization/easy_localization.dart';
import 'package:nurse_app/helper/BuddhistCalendarFormatter.dart';

class DateHelper {
  static String convertStringCalendarToDayWithFormat(DateTime dateString) {
    var formatter = DateFormat("dd/MM/yyyy", 'th');
    var dateTH = formatter.formatInBuddhistCalendarThai(dateString);
    return dateTH;
  }

  static String convertStringCalendarToDayAndTimeWithFormat(
      DateTime dateString) {
    var formatter = DateFormat("dd/MM/yyyy HH:MM", 'th');
    var dateTH = formatter.formatInBuddhistCalendarThai(dateString);
    return dateTH;
  }

  static String convertDateFromApiBuddhist(String dateString) {
    DateTime tempDate =
        new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
    var formatter = DateFormat("dd/MM/yyyy", 'th');
    var dateTH = formatter.formatInBuddhistCalendarThai(tempDate);
    return dateTH;
  }

  static String convertStringCalendarToDayAndWithFormat(DateTime dateString) {
    var formatter = DateFormat("dd MMM yyyy", 'th');
    var dateTH = formatter.formatInBuddhistCalendarThai(dateString);
    return dateTH;
  }

  static String convertStringCalendarToDayFormat(DateTime dateString) {
    var formatter = DateFormat("EEEE dd MMMM yyyy", 'th');
    var dateTH = formatter.formatInBuddhistCalendarThai(dateString);
    return dateTH;
  }

  static String convertDateFormat(DateTime dateString) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateString);
    return formattedDate;
  }

  static String convertTimeToDateApi(String dateString) {
    DateTime tempDate = new DateFormat("dd/MM/yyyy").parse(dateString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(tempDate);
    return formattedDate;
  }

  static DateTime convertStringToDate(String dateString) {
    DateTime tempDate = new DateFormat("dd/MM/yyyy").parse(dateString);
    return tempDate;
  }

  static String convertDateFromApi(String dateString) {
    DateTime tempDate =
        new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
    var formatter = DateFormat("dd/MM/yyyy");
    var dateTH = formatter.formatInBuddhistCalendarThai(tempDate);
    return dateTH;
  }

  static String convertDateToApi(String dateString) {
    DateTime tempDate =
        new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
    String formattedDate = DateFormat('dd/MM/yyyy').format(tempDate);
    return formattedDate;
  }

  static String convertDateFromApiTH(String dateString) {
    DateTime tempDate =
        new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
    String formattedDate = DateFormat("dd/MM/yyyy").format(tempDate);
    return formattedDate;
  }

  static String convertDateFromApiAndTimeTH(String dateString) {
    DateTime tempDate =
        new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
    String formattedDate = DateFormat("dd/MM/yyyy HH:MM").format(tempDate);
    return formattedDate;
  }

  static String convertStringCalendarToTimeAndWithFormat(DateTime dateTime) {
    // DateTime tempDate =
    //     new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
    String data = DateFormat('HH:mm').format(dateTime);

    // var formatter = DateFormat("HH:MM", 'th');
    // var dateTH = formatter.formatInBuddhistCalendarThai(dateTime);
    return data;
  }

  static String convertTimeFormat(
    DateTime dateString,
  ) {
    String formattedDate = DateFormat('HH:mm:ss').format(dateString);
    return formattedDate;
  }

  static DateTime convertStringToDateTime(String dateString) {
    DateTime tempDate = new DateFormat("HH:mm").parse(dateString);
    return tempDate;
  }

  static String convertDateCalendarToMouth(DateTime dateTime) {
    String data = DateFormat('MMM', 'en').format(dateTime);
    return data;
  }

  static String convertDateCalendarToDate(DateTime dateTime) {
    String data = DateFormat('dd', 'en').format(dateTime);
    return data;
  }

  static String convertDateCalendarToDay(DateTime dateTime) {
    String data = DateFormat('EEE', 'en').format(dateTime);
    return data.toUpperCase();
  }
}