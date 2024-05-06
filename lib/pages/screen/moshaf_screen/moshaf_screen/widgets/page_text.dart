import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/data/model/moshaf_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PgaeText extends StatelessWidget {
  const PgaeText({
    super.key,
    required this.filteredTexts,
  });

  final List<MoshafModel> filteredTexts;

  @override
  Widget build(BuildContext context) {
    return Text(
      filteredTexts.map((map) => '${map.ayaText}').join(' '),
      style: TextStyle(
          fontFamily: 'HafsSmart_08',
          fontSize: 22,
          color: BlocProvider.of<ThemeCubit>(context).isDark
              ? Colors.white
              : Colors.black),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
