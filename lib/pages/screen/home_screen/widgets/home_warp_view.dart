import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/shared/app_card.dart';
import 'package:azkar/data/datasource/static/home_grid_data.dart';
import 'package:azkar/pages/screen/home_screen/widgets/in_home_card.dart';
import 'package:flutter/material.dart';

class HomeWarpView extends StatelessWidget {
  const HomeWarpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: width(context, 10),
      runSpacing: height(context, 10),
      children: List.generate(6, (index) {
        return GestureDetector(
          onTap: () {
            navigatWithSlideAnimation(categoryModel[index].widget,
                context: context);
          },
          child: AppCard.home(
            context: context,
            child: InHomeCard(
              index: index,
            ),
          ),
        );
      }),
    );
  }
}
