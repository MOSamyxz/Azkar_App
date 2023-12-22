import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/shared/app_card.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:azkar/data/model/azkar_list_model.dart';
import 'package:azkar/pages/screen/azkar_screen/azkar_full.dart';
import 'package:azkar/pages/widget/azkar/azkar_list/azkar_list_number.dart';
import 'package:azkar/pages/widget/azkar/azkar_list/favorit_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarListItem extends StatelessWidget {
  const AzkarListItem({
    super.key,
    required this.id,
    required this.isFavorite,
    required this.index,
    required this.model,
  });

  final int id;
  final bool isFavorite;
  final int index;
  final AzkarListModel model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          navigatWithSlideAnimation(
              AzkarBuildScreen(
                id: model.azkar![index].idFav!,
                body: '${model.azkar![index].name}',
                azkar: model.azkar![index].azkarBody!,
                catId: model.dhikrId!,
              ),
              context: context);
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AppCard.azkarList(
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
                        model.azkar![index].name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'DG_Kufi',
                            color: AppColors.mainClr),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    AzkarListNumber(
                      id: id,
                      index: index,
                    ),
                  ],
                )),
            FavoriteToggleButton(
              isFavorite: isFavorite,
              index: index,
              onPressed: () {
                BlocProvider.of<AzkarCubit>(context).toggleFavorite(
                    '${BlocProvider.of<AzkarCubit>(context).azkarList[id].azkar![index].idFav}');
              },
            )
          ],
        ),
      ),
    );
  }
}
