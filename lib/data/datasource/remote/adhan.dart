import 'package:azkar/data/model/salah_time_model.dart';
import 'package:dio/dio.dart';

class AzkarServices {
  final Dio dio;
  String baseUrl = 'https://api.aladhan.com/v1/calendarByCity';
  AzkarServices(this.dio);
  Future<SalahTimeModel> getSalahTime(String city, String country) async {
    Response response = await dio.get('$baseUrl?city=$city&country=$country');

    SalahTimeModel salahTimeModel = SalahTimeModel.fromJson(response.data);

    return salahTimeModel;
  }
}
