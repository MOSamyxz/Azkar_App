import 'package:azkar/core/constants/constants.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/core/shared/app_card.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_list_screen/widgets/in_moshaf_list_card.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_screen/moshaf_screen.dart';
import 'package:flutter/material.dart';

class MoshafList extends StatelessWidget {
  const MoshafList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          int num = index + 1;
          var arNum = num.toArabicNumbers;
          return GestureDetector(
            onTap: () {
              navigatWithSlideAnimation(
                  MoshafScreen(
                    targetPage: surahNo[index]['surah'],
                  ),
                  context: context);
            },
            child: AppCard.moshafList(
                context: context,
                child: InMoshafListCard(
                  arNum: arNum,
                  index: index,
                )),
          );
        },
        itemCount: surahNo.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: height(context, 10),
          );
        },
        padding: EdgeInsets.zero,
      ),
    );
  }
}
