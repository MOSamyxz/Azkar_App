import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/pages/widget/azkar/azkar_list/azkar_list_item.dart';
import 'package:azkar/pages/widget/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarListScreen extends StatelessWidget {
  const AzkarListScreen({super.key, required this.id, required this.azkarName});
  final int id;
  final String azkarName;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Scaffold(
            body: Stack(
          children: [
            const Background(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: height(context, 56),
                ),
                CustomAppBar(
                  title: azkarName,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: height(context, 15),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final isFavorite = BlocProvider.of<AzkarCubit>(context)
                          .favorite
                          .contains(
                              "${BlocProvider.of<AzkarCubit>(context).azkarList[id].azkar![index].idFav}");

                      return AzkarListItem(
                        id: id,
                        isFavorite: isFavorite,
                        index: index,
                        model:
                            BlocProvider.of<AzkarCubit>(context).azkarList[id],
                      );
                    },
                    itemCount: BlocProvider.of<AzkarCubit>(context)
                        .azkarList[id]
                        .azkar!
                        .length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: height(context, 10),
                      );
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(
                  height: height(context, 10),
                )
              ],
            ),
          ],
        ));
      },
    );
  }
}
