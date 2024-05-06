import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/data/datasource/static/home_grid_data.dart';
import 'package:flutter/material.dart';

class InHomeCard extends StatelessWidget {
  const InHomeCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            categoryModel[index].image,
            height: height(context, 80),
            width: width(context, 80),
            color: AppColors.mainClr,
          ),
        ),
        SizedBox(
          height: height(context, 10),
        ),
        Text(
          categoryModel[index].text,
          style: Theme.of(context).textTheme.displayMedium,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
