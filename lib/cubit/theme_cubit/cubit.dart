import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/cubit/theme_cubit/state.dart';
import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(AppInitialStats());

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      emit(AppLoadModeState());
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      emit(AppLoadModeState());
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppSaveModeState());
      });
      emit(AppChangeModeState());
    }
  }
}
