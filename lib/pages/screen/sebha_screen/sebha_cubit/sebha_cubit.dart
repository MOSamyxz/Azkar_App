import 'package:azkar/core/services/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaInitial());

  /// Sebha counter
  int index = 0;

  void countIncrement() async {
    index++;
    emit(CounterIncrementStat());
    CacheHelper.setInt(key: 'counter', value: index);
    emit(CounterSaveStat());
  }

  Future<void> loadCounter() async {
    int? savedCounter =  CacheHelper.getInt(key: 'counter');

    index = savedCounter ?? 0;
    emit(CounterLoadStat());
  }

  void countReset() async {
    index = 0;
    emit(CounterResetStat());
    CacheHelper.remove(key: 'counter');
    emit(CounterRemoveStat());
  }
}
