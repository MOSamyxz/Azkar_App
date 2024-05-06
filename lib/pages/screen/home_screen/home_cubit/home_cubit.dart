import 'dart:async';
import 'dart:math';

import 'package:azkar/data/datasource/static/aya_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

// Aya

  String aya = '';
  String sourah = '';

  void initRandomText() {
    setRandomText();
    Timer.periodic(const Duration(hours: 24), (Timer timer) {
      setRandomText();
    });
  }

  void setRandomText() {
    final random = Random();
    final index = random.nextInt(ayaModel.length);

    aya = ayaModel[index].ayaBody;
    sourah = ayaModel[index].sourahName;
    emit(AyaTextStat());
  }
}
