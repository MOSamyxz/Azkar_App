import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/shared/app_card.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:azkar/pages/screen/azkar_screen/azkar_list.dart';
import 'package:azkar/pages/widget/azkar/azkar_category/in_azkar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AzkarGridView extends StatelessWidget {
  const AzkarGridView({
    super.key,
    required List<double> imageWidth,
    required List<double> imageHeights,
    required List<double> itemHeights,
  })  : _imageWidth = imageWidth,
        _imageHeights = imageHeights,
        _itemHeights = itemHeights;
  final List<double> _imageWidth;
  final List<double> _imageHeights;
  final List<double> _itemHeights;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: MasonryGridView.count(
            padding: EdgeInsets.zero,
            mainAxisSpacing: height(context, 10),
            crossAxisSpacing: width(context, 10),
            itemCount:
                BlocProvider.of<AzkarCubit>(context).azkarCategoryList.length,
            crossAxisCount: 2,
            itemBuilder: (context, index) {
              var model =
                  BlocProvider.of<AzkarCubit>(context).azkarCategoryList[index];
              return InkWell(
                onTap: () {
                  navigatWithSlideAnimation(
                      AzkarListScreen(azkarName: model.name!, id: model.id!),
                      context: context);
                },
                child: AppCard.azkar(
                    context: context,
                    cHeight: _itemHeights[index],
                    child: InAzkarCard(
                      model: model,
                      imageWidth: _imageWidth,
                      imageHeights: _imageHeights,
                      index: index,
                    )),
              );
            }),
      ),
    );
  }
}
