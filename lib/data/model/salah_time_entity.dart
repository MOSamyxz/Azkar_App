import 'package:hive/hive.dart';
part 'salah_time_entity.g.dart';

@HiveType(typeId: 0)
class SalahTimeEntity {
  @HiveField(0)
  final String gYear;
  @HiveField(1)
  final String gMonthe;
  @HiveField(2)
  final String gDay;
  @HiveField(3)
  final String gDate;
  @HiveField(4)
  final String hYear;
  @HiveField(5)
  final String hMonthe;
  @HiveField(6)
  final String hDay;
  @HiveField(7)
  final String isha;
  @HiveField(8)
  final String maghrib;
  @HiveField(9)
  final String asr;
  @HiveField(10)
  final String dhuhr;
  @HiveField(11)
  final String sunrise;
  @HiveField(12)
  final String fajr;

  SalahTimeEntity({
    required this.gYear,
    required this.gMonthe,
    required this.gDay,
    required this.gDate,
    required this.hYear,
    required this.hMonthe,
    required this.hDay,
    required this.isha,
    required this.maghrib,
    required this.asr,
    required this.dhuhr,
    required this.sunrise,
    required this.fajr,
  });
}
