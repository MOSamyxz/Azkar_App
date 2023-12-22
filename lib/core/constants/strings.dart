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

  static const String waai = 'assets/waai.png';
  static const String way2allahcom = 'assets/way2allahcom.png';
  static const String othmanalkamees = 'assets/othmanalkamees.png';
  static const String mohelghaleez = 'assets/mohelghaleez.png';
  static const String makanyworld = 'assets/makanyworld.png';
  static const String itsthequranofficial = 'assets/itsthequranofficial.png';
  static const String drhazem = 'assets/drhazem.png';
  static const String amirmounir = 'assets/amirmounir.png';
  static const String abdelkafytube = 'assets/abdelkafytube.png';
}
