import 'package:azkar/core/services/to_ar_month.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/cubit/salah_cubit/salah_cubit.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateItem extends StatelessWidget {
  const DateItem({
    super.key,
    required this.state,
  });
  final SalahTimeSuccesRemoteState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('التاريخ',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: 'KFGQPC',
                color: BlocProvider.of<ThemeCubit>(context).isDark
                    ? Colors.white
                    : Colors.black.withOpacity(0.7))),
        Text(
          '${state.salahList.data![DateTime.now().day - 1].date!.hijri!.day!.toArabicNumbers} ${state.salahList.data![DateTime.now().day - 1].date!.hijri!.month!.ar!} ${state.salahList.data![DateTime.now().day - 1].date!.hijri!.year!.toArabicNumbers} هـ',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
              fontFamily: 'KFGQPC',
              color: BlocProvider.of<ThemeCubit>(context).isDark
                  ? Colors.white
                  : Colors.black),
        ),
        Text(
          '${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.day!.toArabicNumbers} ${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.month!.en!.toArabicMonth} ${state.salahList.data![DateTime.now().day - 1].date!.gregorian!.year!.toArabicNumbers} م',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontFamily: 'KFGQPC',
              color: BlocProvider.of<ThemeCubit>(context).isDark
                  ? Colors.white
                  : Colors.black.withOpacity(0.7)),
        )
      ],
    );
  }
}
