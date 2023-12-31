class SalahTimeModel {
  int? code;
  String? status;
  List<Data>? data;

  SalahTimeModel({this.code, this.status, this.data});

  SalahTimeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

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
  Meta? meta;
  Data({this.timings, this.date, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'timings': timings,
      'date': date,
      'meta': meta,
    };
  }
}

class Meta {
  String? timeZone;
  Meta(this.timeZone);
  Meta.fromJson(Map<String, dynamic> json) {
    timeZone = json['timezone'];
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
  int? number;

  GregorianMonth({this.en, this.number});

  GregorianMonth.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'number': number,
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
