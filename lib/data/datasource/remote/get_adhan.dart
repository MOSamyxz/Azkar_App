import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class AzkarServices {
  final Dio _dio;
  String year = DateFormat.y().format(DateTime.now());
  String month = DateFormat.M().format(DateTime.now());
  AzkarServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio
        .get('https://api.aladhan.com/v1/calendarByCity/$year/$month$endPoint');
    return response.data;
  }
}
