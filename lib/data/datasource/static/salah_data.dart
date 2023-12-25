import 'package:azkar/core/constants/strings.dart';
import 'package:azkar/cubit/salah_cubit/salah_cubit.dart';

List<String> salahTimeFun(SalahTimeSuccesRemoteState state) {
  List<String> salahTime = [
    state.salahList.data![DateTime.now().day - 1].timings!.fajr!,
    state.salahList.data![DateTime.now().day - 1].timings!.sunrise!,
    state.salahList.data![DateTime.now().day - 1].timings!.dhuhr!,
    state.salahList.data![DateTime.now().day - 1].timings!.asr!,
    state.salahList.data![DateTime.now().day - 1].timings!.maghrib!,
    state.salahList.data![DateTime.now().day - 1].timings!.isha!,
  ];
  return salahTime;
}

List<String> salahName() {
  List<String> salah = [
    'الفجر',
    'الشروق',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء',
  ];
  return salah;
}

List<String> images() {
  List<String> image = [
    AppStrings.fajr,
    AppStrings.sunrise,
    AppStrings.dhuhr,
    AppStrings.asr,
    AppStrings.maghrib,
    AppStrings.isha
  ];
  return image;
}
