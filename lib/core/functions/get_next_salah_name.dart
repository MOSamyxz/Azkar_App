import 'package:azkar/cubit/salah_cubit/salah_cubit.dart';
import 'package:intl/intl.dart';

String nameOfNextSalah(SalahTimeSuccesRemoteState state) {
  String month = state.salahList.data![DateTime.now().day - 1].date!.gregorian!
              .month!.number! <
          10
      ? "0${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}"
      : '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}';
  DateTime fajr = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-$month-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.fajr!.split(' ')[0]))}');

  DateTime sunrise = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-$month-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.sunrise!.split(' ')[0]))}');

  DateTime dhuhr = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-$month-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.dhuhr!.split(' ')[0]))}');

  DateTime asr = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-$month-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.asr!.split(' ')[0]))}');

  DateTime maghrib = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-$month-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.maghrib!.split(' ')[0]))}');

  DateTime isha = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-$month-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.isha!.split(' ')[0]))}');
  DateTime now = DateTime.now();

  String nextSalah = fajr.compareTo(now) > 0
      ? 'الفجر'
      : sunrise.compareTo(now) > 0
          ? 'الشروق'
          : dhuhr.compareTo(now) > 0
              ? 'الظهر'
              : asr.compareTo(now) > 0
                  ? 'العصر'
                  : maghrib.compareTo(now) > 0
                      ? 'المغرب'
                      : isha.compareTo(now) > 0
                          ? 'العشاء'
                          : 'الفجر';

  String name = nextSalah;
  return name;
}
