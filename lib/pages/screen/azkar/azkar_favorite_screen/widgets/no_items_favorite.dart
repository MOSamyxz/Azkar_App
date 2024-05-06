import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:flutter/material.dart';

class NoItemFavorite extends StatelessWidget {
  const NoItemFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width(context, 250),
        height: height(context, 120),
        child: Column(
          children: [
            Image.asset(
              AppImages.heartClr,
              width: width(context, 71.25),
              height: height(context, 63.33),
            ),
            SizedBox(
              height: height(context, 13.5),
            ),
            Text(
              'لا يوجد أذكار فى المفضلة',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
