import 'package:intl/intl.dart';

class AppStrigs {
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
}
