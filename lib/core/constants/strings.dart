import 'package:intl/intl.dart';

class AppStrings {
//========================main page=========================
  static String date = DateFormat.MMMEd('ar_SA').format(DateTime.now());

//========================JSON files=========================
  static String azkarcategorylist = 'jsonfile/azkarcategorylist.json';
  static String azkarlist = 'jsonfile/azkarlist.json';
  static String favazkarlist = 'jsonfile/favazkarlist.json';
  static String hadithlist = 'jsonfile/hadithlist.json';
  static String hadith = 'jsonfile/hadith.json';
  static String quran = 'jsonfile/hafs_smart_v8.json';
  static String citiesaren = 'jsonfile/citiesaren.json';

//========================Daawa=========================
  static const String daawaButton = 'assets/daawa_button.png';

  //========================salah=========================
  static const String fajr = 'assets/fajr.png';
  static const String sunrise = 'assets/sunrise.png';
  static const String dhuhr = 'assets/dhuhr.png';
  static const String asr = 'assets/asr.png';
  static const String maghrib = 'assets/maghrib.png';
  static const String isha = 'assets/isha.png';
}
