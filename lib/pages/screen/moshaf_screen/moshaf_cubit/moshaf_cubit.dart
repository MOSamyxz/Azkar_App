import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'moshaf_state.dart';

class MoshafCubit extends Cubit<MoshafState> {
  MoshafCubit() : super(MoshafInitial());

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
}
