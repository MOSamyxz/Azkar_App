import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarListNumber extends StatelessWidget {
  const AzkarListNumber({
    super.key,
    required this.id,
    required this.index,
  });

  final int id;
  final int index;
  @override
  Widget build(BuildContext context) {
    int i = BlocProvider.of<AzkarCubit>(context)
        .azkarList[id]
        .azkar![index]
        .idNumber!;
    return Padding(
      padding: EdgeInsets.only(
          left: width(context, 10), right: width(context, 14.5)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.frame,
            width: width(context, 32.5),
            height: height(context, 32.5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              i.toArabicNumbers,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DG_Kufi',
                  color: AppColors.mainClr),
            ),
          ),
        ],
      ),
    );
  }
}
