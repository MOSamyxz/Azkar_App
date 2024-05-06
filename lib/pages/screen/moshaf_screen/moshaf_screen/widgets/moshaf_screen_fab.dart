import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoshafScreenFAB extends StatelessWidget {
  const MoshafScreenFAB({
    super.key,
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
          ? const Color.fromARGB(255, 86, 86, 86)
          : const Color.fromARGB(255, 246, 234, 209),
      onPressed: () {
        BlocProvider.of<AzkarCubit>(context).savePage(currentPage + 1);
        BlocProvider.of<AzkarCubit>(context).loadPage();
        Fluttertoast.showToast(
          msg: ' تم الحفظ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
      child: BlocProvider.of<AzkarCubit>(context).savedPage == currentPage + 1
          ? const Icon(
              Icons.bookmark_added,
              color: AppColors.mainClr,
            )
          : const Icon(
              Icons.bookmark_add,
              color: AppColors.mainClr,
            ),
    );
  }
}
