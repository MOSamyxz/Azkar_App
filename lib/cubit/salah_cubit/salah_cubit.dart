import 'package:azkar/data/datasource/remote/get_adhan.dart';
import 'package:azkar/data/model/salah_time_entity.dart';
import 'package:azkar/data/model/salah_time_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:hive/hive.dart';

part 'salah_state.dart';

class SalahCubit extends Cubit<SalahState> {
  SalahCubit() : super(SalahInitial());

  Future<List<SalahTimeEntity>> getSalahTime(
      String city, String country) async {
    emit(NoSalahTimeState());

    emit(SalahTimeLoadingState());
    var data = await AzkarServices(Dio())
        .get(endPoint: '?city=$city&country=$country');

    List<SalahTimeEntity> salah = getSalah(data);

    saveSalahTime(salah, 'salahbox');
    emit(SalahTimeSuccesState(salah));

    return salah;
  }

  List<SalahTimeEntity> getSalahTimeLocal() {
    var box = Hive.box<SalahTimeEntity>('salahbox');
    return box.values.toList();
  }

  void saveSalahTime(List<SalahTimeEntity> salah, String boxName) {
    var box = Hive.box<SalahTimeEntity>(boxName);
    box.addAll(salah);
  }

  List<SalahTimeEntity> getSalah(data) {
    List<SalahTimeEntity> salah = [];
    for (var salahMap in data['data']) {
      salah.add(SalahTimeModel.fromJson(salahMap));
    }
    return salah;
  }

  Future<List<SalahTimeEntity>> getSalahData(
      String city, String country) async {
    List<SalahTimeEntity> salahList;
    salahList = getSalahTimeLocal();
    if (salahList.isNotEmpty) {
      return salahList;
    }
    salahList = await getSalahTime(city, country);
    return salahList;
  }
}
