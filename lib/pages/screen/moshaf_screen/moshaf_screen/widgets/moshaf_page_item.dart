import 'package:azkar/core/constants/size.dart';
import 'package:azkar/data/model/moshaf_model.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_screen/widgets/moshaf_page.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_screen/widgets/page_header.dart';
import 'package:flutter/material.dart';

class MoshafPageItem extends StatelessWidget {
  const MoshafPageItem({
    super.key,
    required this.filteredTexts,
    required this.pageNum,
    required this.i,
  });

  final List<MoshafModel> filteredTexts;
  final String pageNum;
  final int i;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          PageHeader(i: i),
          i == 0
              ? SizedBox(
                  height: height(context, 250),
                )
              : i == 1
                  ? SizedBox(
                      height: height(context, 200),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
          MoshafPage(filteredTexts: filteredTexts, pageNum: pageNum),
          SizedBox(
            height: height(context, 30),
          )
        ],
      ),
    );
  }
}
