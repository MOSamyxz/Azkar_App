import 'package:azkar/data/datasource/remote/get_adhan.dart';
import 'package:azkar/data/model/salah_time_model.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

part 'salah_state.dart';

class SalahCubit extends Cubit<SalahState> {
  SalahCubit() : super(SalahInitial());

  Future<void> fetchApiData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection

      emit(NoInternetState());
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    } else {
      // Connected to the internet
      emit(InternetState());
      Position position = await _determinePosition();

      return getSalahTime(
          position.latitude.toString(), position.longitude.toString());
    }
  }

  late String city;
  late Position position;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    final List<Placemark> placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
      localeIdentifier: 'ar_eg',
    );
    city = placemark[0].locality!;

    return position;
  }

  void getSalahTime(String latitude, String longitude) async {
    try {
      emit(SalahTimeLoadingState());
      SalahTimeModel salahTimeModel =
          await AzkarServices(Dio()).getSalahTime(latitude, longitude);

      emit(SalahTimeSuccesRemoteState(salahTimeModel));
    } on Exception {
      emit(SalahTimeFailState());
    }
  }
}
