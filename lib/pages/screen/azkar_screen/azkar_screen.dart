import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/data/datasource/static/azkar_grid_data.dart';
import 'package:azkar/pages/screen/azkar_screen/azkar_favorite.dart';
import 'package:azkar/pages/widget/azkar/azkar_category/favorite_icon_button.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(children: [
            Background(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: height(context, 56),
                ),
                CustomAppBar(
                  title: "الأذكار",
                  widget: InkWell(
                    child: const FavoriteIconButton(),
                    onTap: () {
                      navigatWithSlideAnimation(const AzkarFavoriteScreen(),
                          context: context);
                    },
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: height(context, 15),
                ),
                AzkarGridView(
                    imageWidth: imageWidth,
                    imageHeights: imageHeights,
                    itemHeights: itemHeights),
                SizedBox(height: height(context, 10)),
              ],
            )
          ]),
        );
      },
    );
  }
}
