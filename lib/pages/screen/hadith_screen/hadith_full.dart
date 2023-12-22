import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/size.dart';
import '../../../cubit/azkar_cubit/azkar_state.dart';

class HadithBuildScreen extends StatelessWidget {
  const HadithBuildScreen(
      {super.key, required this.id, required this.hadithNum});
  final int id;
  final String hadithNum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.mainClr,
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
                  title: hadithNum,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: height(context, 19),
                ),
                BlocBuilder<AzkarCubit, AzkarState>(
                  builder: (context, state) {
                    var model =
                        BlocProvider.of<AzkarCubit>(context).hadithList[id];
                    return Expanded(
                      child: HadithFullItem(model: model),
                    );
                  },
                ),
                SizedBox(
                  height: height(context, 19),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
