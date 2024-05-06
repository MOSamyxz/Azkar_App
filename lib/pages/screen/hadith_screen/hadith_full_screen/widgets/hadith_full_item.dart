import 'package:azkar/pages/screen/hadith_screen/hadith_full_screen/widgets/hadith_body_build_item.dart';
import 'package:azkar/pages/screen/hadith_screen/hadith_full_screen/widgets/hadith_build_item.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/hadith_model.dart';

class HadithFullItem extends StatelessWidget {
  const HadithFullItem({
    super.key,
    required this.model,
  });

  final HadithModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HadithBuildItem(model: model),
          const SizedBox(
            height: 16,
          ),
          HadithBodyBuildItem(model: model)
        ],
      ),
    );
  }
}
