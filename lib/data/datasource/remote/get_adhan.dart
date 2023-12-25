import 'package:azkar/data/model/salah_time_model.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class AzkarServices {
  final Dio _dio;
  String year = DateFormat.y().format(DateTime.now());
  String month = DateFormat.M().format(DateTime.now());
  AzkarServices(this._dio);

  Future<SalahTimeModel> getSalahTime(String latitude, String longitude) async {
    var response = await _dio.get(
        'https://api.aladhan.com/v1/calendar/$year/$month?latitude=$latitude&longitude=$longitude');

    SalahTimeModel salahTimeModel = SalahTimeModel.fromJson(response.data);

    return salahTimeModel;
  }
}
