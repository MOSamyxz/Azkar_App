import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageNumber extends StatelessWidget {
  const PageNumber({
    super.key,
    required this.pageNum,
  });

  final String pageNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: width(context, 10), right: width(context, 14.5)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.frame,
              width: width(context, 50),
              height: height(context, 50),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                pageNum,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Gamila',
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? Colors.white
                        : Colors.black),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
