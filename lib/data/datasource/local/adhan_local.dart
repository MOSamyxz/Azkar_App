import 'package:azkar/data/model/salah_time_entity.dart';
import 'package:hive/hive.dart';

class AdhanLocalData {
  List<SalahTimeEntity> fetchNewestBooks() {
    var box = Hive.box<SalahTimeEntity>('salahbox');
    return box.values.toList();
  }
}
