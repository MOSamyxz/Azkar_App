import 'dart:convert';
import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/data/model/azkar_category_list_model.dart';
import 'package:azkar/data/model/azkar_list_model.dart';
import 'package:azkar/data/model/countrey_model.dart';
import 'package:azkar/data/model/fav_azkar_model.dart';
import 'package:azkar/data/model/moshaf_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/hadith_list_model.dart';
import '../../data/model/hadith_model.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AppInitialStats());

  void initial() {
    loadAzkarCategory();
    loadAzkarList();
    loadFavAzkarList();
    loadFavorites();
    loadHadithList();
    loadHadith();
    lodaQuran();
    loadPage();
    loadHPage();
    getTime();
  }

//Quran
  List<MoshafModel> moshafList = [];
  late MoshafModel moshafModel;

  Future lodaQuran() async {
    rootBundle.loadString("jsonfile/hafs_smart_v8.json").then((data) {
      var response = json.decode(data);
      response.forEach((e) {
        moshafModel = MoshafModel.fromJson(e);

        //   if (hadithDetail.hadithId == model.id) {
        moshafList.add(moshafModel);
        // }
      });
    }).catchError((error) {});
  }

  int savedPage = 0;

  void savePage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('page', page);
    emit(PageSaveStat());
  }

  Future<void> loadPage() async {
    final prefs = await SharedPreferences.getInstance();
    final sharedPage = prefs.getInt('page');

    savedPage = sharedPage ?? 0;
    emit(PageLoadStat());
  }

  void removePage() async {
    savedPage = 0;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('page');
    emit(PageRemoveStat());
  }

  int savedHPage = 0;

  void saveHPage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('hpage', page);
    emit(HPageSaveStat());
  }

  Future<void> loadHPage() async {
    final prefs = await SharedPreferences.getInstance();
    final sharedHPage = prefs.getInt('hpage');

    savedHPage = sharedHPage ?? 0;
    emit(HPageLoadStat());
  }

  void removeHPage() async {
    savedHPage = 0;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('hpage');
    emit(HPageRemoveStat());
  }
//Azkar Category

  List<AzkarCategoryListModel> azkarCategoryList = [];
  late AzkarCategoryListModel azkarCategoryListModel;

  Future<void> loadAzkarCategory() async {
    emit(AzkarCategoryLoadingState());
    rootBundle.loadString("jsonfile/azkarcategorylist.json").then((data) {
      var response = json.decode(data);
      response.forEach((e) {
        azkarCategoryListModel = AzkarCategoryListModel.fromJson(e);

        azkarCategoryList.add(azkarCategoryListModel);
        emit(AzkarCategoryLoadedState());
      });
    }).catchError((error) {});
  }

  //Azkar List

  List<AzkarListModel> azkarList = [];
  late AzkarListModel azkarListModel;

  Future<void> loadAzkarList() async {
    rootBundle.loadString("jsonfile/azkarlist.json").then((data) {
      var response = json.decode(data);
      response.forEach((e) {
        azkarListModel = AzkarListModel.fromJson(e);
        azkarList.add(azkarListModel);
      });
    }).catchError((error) {});
  }
  //Fav Azkar

  List<FavAzkarListModel> favAzkarList = [];
  late FavAzkarListModel favAzkarListModel;

  Future<void> loadFavAzkarList() async {
    rootBundle.loadString("jsonfile/favazkarlist.json").then((data) {
      var response = json.decode(data);
      response.forEach((e) {
        favAzkarListModel = FavAzkarListModel.fromJson(e);
        favAzkarList.add(favAzkarListModel);
      });
    }).catchError((error) {});
  }

  //Fav Azkar

  Set<String> favorite = {};

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];

    favorite = Set<String>.from(favorites);
    emit(FavAzkarLoadedState());
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', favorite.toList());
  }

  void toggleFavorite(String item) {
    if (favorite.contains(item)) {
      favorite.remove(item);
      emit(RemoveFavoriteState());
    } else {
      favorite.add(item);

      emit(AddFavoriteState());
    }
    saveFavorites();
  }

//Hadith list

  List<HadithListModel> hadithNameList = [];
  late HadithListModel hadithModel;

  Future<void> loadHadithList() async {
    rootBundle.loadString("jsonfile/hadithlist.json").then((data) {
      var response = json.decode(data);
      response.forEach((e) {
        hadithModel = HadithListModel.fromJson(e);
        hadithNameList.add(hadithModel);
      });
    }).catchError((error) {});
  }

  //Hadith
  List<HadithModel> hadithList = [];

  late HadithModel hadithDetailModel;

  Future<void> loadHadith() async {
    rootBundle.loadString("jsonfile/hadith.json").then((data) {
      var response = json.decode(data);
      response.forEach((e) {
        hadithDetailModel = HadithModel.fromJson(e);

        //   if (hadithDetail.hadithId == model.id) {
        hadithList.add(hadithDetailModel);
        // }
      });
    }).catchError((error) {});
  }

//cities

  List<CitiesModel> countryCity = [];

  late CitiesModel cityModel;

  Future<void> loadCountries() async {
    rootBundle.loadString("jsonfile/citiesaren.json").then((data) {
      var response = json.decode(data);
      response.forEach((e) {
        cityModel = CitiesModel.fromJson(e);

        //   if (hadithDetail.hadithId == model.id) {
        countryCity.add(cityModel);

        // }
      });
    }).catchError((error) {});
  }

// Search
  void initSearch() {
    foundCitis = countryCity;
  }

  List<CitiesModel> foundCitis = [];

  void search(String query) {
    List<CitiesModel> result = [];
    if (query.isEmpty) {
      result = countryCity;
      emit(ListEmptyState());
    } else {
      result = countryCity
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(FilterListState());
    }
    foundCitis = result;
    emit(FilterListState());
  }

  /// Notification Time

  void setTime(context) async {
    TimeOfDay? pickedDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedDate != null) {
      CacheHelper.setInt(key: 'sNotificationH', value: pickedDate.hour);
      CacheHelper.setInt(key: 'sNotificationM', value: pickedDate.minute);
      getTime();
    }
  }

  void getTime() {
    CacheHelper.getInt(key: 'sNotificationH');
    CacheHelper.getInt(key: 'sNotificationM');
  }
}
