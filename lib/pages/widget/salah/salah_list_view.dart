import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/get_next_salah_name.dart';
import 'package:azkar/cubit/salah_cubit/salah_cubit.dart';
import 'package:azkar/data/datasource/static/salah_data.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';

class SalahListView extends StatelessWidget {
  const SalahListView({
    super.key,
    required this.state,
  });
  final SalahTimeSuccesRemoteState state;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: ((context, index) {
            List<String> salahTime = salahTimeFun(state);
            List<String> salah = salahName();
            List<String> image = images();
            String nextSalah = nameOfNextSalah(state);

            return Container(
              color: nextSalah == salah[index]
                  ? Colors.amber.withOpacity(0.15)
                  : Colors.transparent,
              child: SalahItem(
                salah: salah[index],
                time: salahTime[index],
                image: image[index],
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return SizedBox(
              height: height(context, 16),
            );
          }),
          itemCount: 6),
    );
  }
}
