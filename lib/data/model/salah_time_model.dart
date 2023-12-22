import 'package:azkar/data/model/salah_time_entity.dart';

class SalahTimeModel extends SalahTimeEntity {
  int? code;
  String? status;
  Data? data;

  SalahTimeModel({this.code, this.status, this.data})
      : super(
            gYear: data!.date!.gregorian!.year!,
            gMonthe: data.date!.gregorian!.month!.en!,
            gDay: data.date!.gregorian!.day!,
            gDate: data.date!.gregorian!.date!,
            hYear: data.date!.hijri!.year!,
            hMonthe: data.date!.hijri!.month!.ar!,
            hDay: data.date!.hijri!.day!,
            isha: data.timings!.isha!,
            maghrib: data.timings!.maghrib!,
            asr: data.timings!.asr!,
            dhuhr: data.timings!.dhuhr!,
            sunrise: data.timings!.sunrise!,
            fajr: data.timings!.fajr!);

  factory SalahTimeModel.fromJson(Map<String, dynamic> json) => SalahTimeModel(
        code: json['code'],
        status: json['status'],
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'data': data,
    };
  }
}

class Data {
  Timings? timings;
  Date? date;

  Data({
    this.timings,
    this.date,
  });

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'timings': timings,
      'date': date,
    };
  }
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings(
      {this.fajr,
      this.sunrise,
      this.dhuhr,
      this.asr,
      this.sunset,
      this.maghrib,
      this.isha,
      this.imsak,
      this.midnight,
      this.firstthird,
      this.lastthird});

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
    firstthird = json['Firstthird'];
    lastthird = json['Lastthird'];
  }

  Map<String, dynamic> toJson() {
    return {
      'fajr': fajr,
      'sunrise': sunrise,
      'dhuhr': dhuhr,
      'asr': asr,
      'sunset': sunset,
      'maghrib': maghrib,
      'isha': isha,
      'imsak': imsak,
      'midnight': midnight,
      'firstthird': firstthird,
      'lastthird': lastthird,
    };
  }
}

class Date {
  String? readable;
  Gregorian? gregorian;
  Hijri? hijri;

  Date({this.readable, this.gregorian, this.hijri});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json['gregorian'])
        : null;
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'readable': readable,
      'gregorian': gregorian,
      'hijri': hijri,
    };
  }
}

class Gregorian {
  String? date;
  String? day;
  GregorianMonth? month;
  String? year;

  Gregorian({
    this.date,
    this.day,
    this.month,
    this.year,
  });

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];

    day = json['day'];

    month =
        json['month'] != null ? GregorianMonth.fromJson(json['month']) : null;
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': day,
      'month': month,
      'year': year,
    };
  }
}

class GregorianMonth {
  String? en;

  GregorianMonth({this.en});

  GregorianMonth.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
    };
  }
}

class Hijri {
  String? date;
  String? day;
  Weekday? weekday;
  HijriMonth? month;
  String? year;

  Hijri({
    this.date,
    this.day,
    this.weekday,
    this.month,
    this.year,
  });

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? HijriMonth.fromJson(json['month']) : null;
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': day,
      'weekday': weekday,
      'month': month,
      'year': year,
    };
  }
}

class Weekday {
  String? ar;

  Weekday({this.ar});

  Weekday.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    return {
      'ar': ar,
    };
  }
}

class HijriMonth {
  int? number;
  String? en;
  String? ar;

  HijriMonth({this.number, this.en, this.ar});

  HijriMonth.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'en': en,
      'ar': ar,
    };
  }
}
