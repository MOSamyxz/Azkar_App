import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/get_duration_to_next_salah.dart';
import 'package:azkar/core/functions/get_next_salah_name.dart';
import 'package:azkar/cubit/salah_cubit/salah_cubit.dart';

import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalahScreenBody extends StatelessWidget {
  const SalahScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalahCubit, SalahState>(
      builder: (context, state) {
        if (state is SalahTimeSuccesRemoteState) {
          Duration dur = getDurationToNextSalah(state);
          String nextSalah = nameOfNextSalah(state);
          return Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                NextSalahCard(
                    salah: nextSalah, child: CountDownToSalah(dur: dur)),
                SizedBox(
                  height: height(context, 10),
                ),
                DateItem(
                  state: state,
                ),
                SalahListView(state: state),
                const LocationItem(),
                SizedBox(
                  height: height(context, 20),
                )
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
