import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/data/model/azkar_category_list_model.dart';
import 'package:flutter/material.dart';

class InAzkarCard extends StatelessWidget {
  const InAzkarCard({
    super.key,
    required this.model,
    required List<double> imageWidth,
    required List<double> imageHeights,
    required this.index,
  })  : _imageWidth = imageWidth,
        _imageHeights = imageHeights;

  final AzkarCategoryListModel model;
  final List<double> _imageWidth;
  final List<double> _imageHeights;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height(context, 10),
        ),
        Image.asset(
          model.image!,
          //  color: AppColors.mainClr,
          width: width(context, _imageWidth[index]),
          height: height(context, _imageHeights[index]),
        ),
        SizedBox(
          height: height(context, 12),
        ),
        Text(
          model.name!,
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
        ),
        Text(
          model.number! >= 9
              ? "${model.number!.toArabicNumbers} ذكر"
              : "${model.number!.toArabicNumbers} أذكار",
          style: const TextStyle(
              fontSize: 11,
              fontFamily: 'Gamila',
              fontWeight: FontWeight.bold,
              color: AppColors.mainClr),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        )
      ],
    );
  }
}
