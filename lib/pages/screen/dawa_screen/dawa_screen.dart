import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/size.dart';
import '../../../core/shared/background.dart';
import '../../../core/shared/custom_app_bar.dart';
import '../../../cubit/azkar_cubit/azkar_cubit.dart';
import '../../../cubit/azkar_cubit/azkar_state.dart';
import '../../../data/datasource/static/daawa_data.dart';
import '../../widget/daawa/daawa_item.dart';

class DawaScreen extends StatelessWidget {
  const DawaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
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
                  title: 'الدعوة الى الله',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: height(context, 19),
                ),
                BlocBuilder<AzkarCubit, AzkarState>(
                  builder: (context, state) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: daawaModel.length,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              return DaawaItem(
                                  daawaModel: daawaModel, index: index);
                            }));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
