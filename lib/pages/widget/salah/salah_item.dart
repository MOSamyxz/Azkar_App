import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../cubit/theme_cubit/cubit.dart';

class SalahItem extends StatelessWidget {
  const SalahItem({
    super.key,
    required this.salah,
    required this.time,
    required this.image,
  });
  final String salah;
  final String time;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: width(context, 20),
        ),
        Text(
          DateFormat('h:mm a ')
              .format(DateFormat('HH:mm').parse(time.split(' ')[0]))
              .split(' ')[0]
              .toArabicNumbers,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gamila',
            color: BlocProvider.of<ThemeCubit>(context).isDark
                ? Colors.white
                : Colors.black.withOpacity(0.7),
          ),
        ),
        const Spacer(),
        Text(
          salah,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontFamily: 'Gamila',
              color: BlocProvider.of<ThemeCubit>(context).isDark
                  ? Colors.white
                  : Colors.black.withOpacity(0.7)),
        ),
        SizedBox(
          width: width(context, 15),
        ),
        Image.asset(
          image,
          color: AppColors.mainClr,
          width: width(context, 30),
          height: height(context, 30),
        ),
      ],
    );
  }
}
