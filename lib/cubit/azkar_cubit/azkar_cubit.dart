import 'dart:convert';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/data/model/azkar_category_list_model.dart';
import 'package:azkar/data/model/azkar_list_model.dart';
import 'package:azkar/data/model/fav_azkar_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AppInitialStats());

  void initial() {
    loadAzkarCategory();
    loadAzkarList();
    loadFavAzkarList();
    loadFavorites();
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
}
