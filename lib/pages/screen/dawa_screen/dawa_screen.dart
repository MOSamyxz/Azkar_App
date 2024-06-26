import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/data/datasource/static/daawa_data.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/daawa_item.dart';

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
