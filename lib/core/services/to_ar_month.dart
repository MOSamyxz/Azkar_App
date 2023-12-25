library arabic_month;

class _ArabicMonth {
  static String convert(Object value) {
    assert(
      value is String,
      "The value object must be of type 'int' or 'String'.",
    );

    return _toArabicmonth(value as String);
  }

  static String _toArabicmonth(String value) {
    return value
        .replaceAll('January', 'يناير')
        .replaceAll('February', 'فبراير')
        .replaceAll('March', 'مارس')
        .replaceAll('April', 'إبريل')
        .replaceAll('May', 'مايو')
        .replaceAll('June', 'يونيو')
        .replaceAll('July', 'يوليو')
        .replaceAll('August', 'أغسطس')
        .replaceAll('September', 'سبتمبر')
        .replaceAll('October', 'أكتوبر')
        .replaceAll('November', 'نوفمبر')
        .replaceAll('December', 'ديسمبر');
  }
}

extension StringExtensions on String {
  /// Converts English numbers to the Arabic numbers format
  ///
  ///
  /// Example:
  /// ```dart
  /// final arabicNumbers = '0123456789'.toArabicNumbers;
  /// // result: ٠١٢٣٤٥٦٧٨٩
  /// ```
  String get toArabicMonth {
    return _ArabicMonth.convert(this);
  }
}
