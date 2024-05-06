import 'package:azkar/data/model/moshaf_model.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_screen/widgets/page_num.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_screen/widgets/page_text.dart';
import 'package:flutter/material.dart';

class MoshafPage extends StatelessWidget {
  const MoshafPage({
    super.key,
    required this.filteredTexts,
    required this.pageNum,
  });

  final List<MoshafModel> filteredTexts;
  final String pageNum;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Column(children: [
              PgaeText(filteredTexts: filteredTexts),
              PageNumber(pageNum: pageNum)
            ])),
          ],
        ),
      ],
    );
  }
}
