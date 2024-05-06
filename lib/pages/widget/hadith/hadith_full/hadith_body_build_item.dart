import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/theme_cubit/cubit.dart';
import '../../../../data/model/hadith_model.dart';

class HadithBodyBuildItem extends StatelessWidget {
  const HadithBodyBuildItem({
    super.key,
    required this.model,
  });

  final HadithModel model;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${model.hadithExplain}",
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontFamily: 'Gamila',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: BlocProvider.of<ThemeCubit>(context).isDark
            ? const Color.fromARGB(255, 184, 182, 182)
            : Color.fromARGB(255, 148, 146, 146),
      ),
    );
  }
}
