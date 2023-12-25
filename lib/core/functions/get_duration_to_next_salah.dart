import 'package:azkar/cubit/salah_cubit/salah_cubit.dart';
import 'package:intl/intl.dart';

Duration getDurationToNextSalah(SalahTimeSuccesRemoteState state) {
  DateTime fajr = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.fajr!.split(' ')[0]))}');

  DateTime fajrNextDay = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-${state.salahList.data![DateTime.now().day].date!.gregorian!.month!.number!}-${state.salahList.data![DateTime.now().day].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day].timings!.fajr!.split(' ')[0]))}');

  DateTime sunrise = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.sunrise!.split(' ')[0]))}');

  DateTime dhuhr = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.dhuhr!.split(' ')[0]))}');

  DateTime asr = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.asr!.split(' ')[0]))}');

  DateTime maghrib = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.maghrib!.split(' ')[0]))}');

  DateTime isha = DateTime.parse(
      '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.number!}-${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!} ${DateFormat.Hms().format(DateFormat('HH:mm').parse(state.salahList.data![DateTime.now().day - 1].timings!.isha!.split(' ')[0]))}');
  DateTime now = DateTime.now();

  DateTime nextSalah = fajr.compareTo(now) > 0
      ? fajr
      : sunrise.compareTo(now) > 0
          ? sunrise
          : dhuhr.compareTo(now) > 0
              ? dhuhr
              : asr.compareTo(now) > 0
                  ? asr
                  : maghrib.compareTo(now) > 0
                      ? maghrib
                      : isha.compareTo(now) > 0
                          ? isha
                          : fajrNextDay;

  Duration dur = nextSalah.difference(now);
  return dur;
}
