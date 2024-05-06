import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/function.dart';
import '../../../../data/model/fav_azkar_model.dart';
import '../../../screen/azkar_screen/azkar_full.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({
    super.key,
    required this.index,
    required this.model,
  });
  final int index;
  final FavAzkarListModel model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          navigatWithSlideAnimation(
              AzkarBuildScreen(
                id: model.idFav!,
                body: '${model.name}',
                azkar: model.azkarBody!,
                catId: 0,
              ),
              context: context);
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AppCard.favoriteList(
                context: context,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width(context, 50),
                    ),
                    Expanded(
                      child: Text(
                        model.name!,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Gamila',
                            color: AppColors.mainClr),
                      ),
                    ),
                    FavoritListNumber(
                      index: index,
                    ),
                  ],
                )),
            FavoriteToggleButton(
                isFavorite: true,
                index: index,
                onPressed: () {
                  BlocProvider.of<AzkarCubit>(context).toggleFavorite(
                      '${BlocProvider.of<AzkarCubit>(context).favAzkarList[int.parse(BlocProvider.of<AzkarCubit>(context).favorite.toList()[index])].idFav}');
                })
          ],
        ),
      ),
    );
  }
}
