import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarFavoriteScreen extends StatelessWidget {
  const AzkarFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Background(),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height(context, 56),
                  ),
                  //test
                  CustomAppBar(
                    title: 'المفضلة',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: height(context, 15),
                  ),
                  BlocProvider.of<AzkarCubit>(context).favorite.isEmpty
                      ? const Expanded(child: NoItemFavorite())
                      : Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => FavoriteListItem(
                              index: index,
                              model: BlocProvider.of<AzkarCubit>(context)
                                      .favAzkarList[
                                  int.parse(BlocProvider.of<AzkarCubit>(context)
                                      .favorite
                                      .toList()[index])],
                            ),
                            itemCount: BlocProvider.of<AzkarCubit>(context)
                                .favorite
                                .length,
                            separatorBuilder:
                                (BuildContext context, int index) {
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
              )
            ],
          ),
        );
      },
    );
  }
}
