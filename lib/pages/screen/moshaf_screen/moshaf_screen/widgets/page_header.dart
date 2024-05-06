import 'package:azkar/core/constants/constants.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: BlocProvider.of<ThemeCubit>(context).isDark
                ? const Color.fromARGB(255, 71, 71, 71)
                : const Color(0xffFCF6EA),
          ),
          child: Text(
            surahNames[i],
            style: TextStyle(
                fontFamily: 'HafsSmart_08',
                fontSize: 14,
                color: BlocProvider.of<ThemeCubit>(context).isDark
                    ? Colors.white
                    : Colors.black),
          ),
        ),
        const Spacer(),
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).isDark
                  ? const Color.fromARGB(255, 71, 71, 71)
                  : const Color(0xffFCF6EA),
            ),
            child: Text(
              jozzName[i],
              style: TextStyle(
                  fontFamily: 'HafsSmart_08',
                  fontSize: 14,
                  color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white
                      : Colors.black),
            )),
      ],
    );
  }
}
