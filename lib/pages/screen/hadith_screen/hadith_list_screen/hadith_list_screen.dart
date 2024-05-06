import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Background(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width(context, 20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: height(context, 56),
              ),
              CustomAppBar(
                title: 'الأربعين النووية',
                onTap: () {
                  navigateBack(context);
                },
              ),
              SizedBox(
                height: height(context, 19),
              ),
              BlocBuilder<AzkarCubit, AzkarState>(builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      var model = BlocProvider.of<AzkarCubit>(context)
                          .hadithNameList[index];
                      return HadithListItem(model: model);
                    },
                    itemCount: BlocProvider.of<AzkarCubit>(context)
                        .hadithNameList
                        .length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: height(context, 10),
                      );
                    },
                    padding: EdgeInsets.zero,
                  ),
                );
              }),
              SizedBox(
                height: height(context, 10),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
