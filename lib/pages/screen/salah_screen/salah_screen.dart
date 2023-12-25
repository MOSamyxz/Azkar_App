import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/cubit/salah_cubit/salah_cubit.dart';
import 'package:azkar/pages/widget/salah/salah_body.dart';

import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalahScreen extends StatelessWidget {
  const SalahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalahCubit()..fetchApiData(),
      child: Scaffold(
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
                    title: 'أوقات الصلاة',
                    onTap: () {
                      navigateBack(context);
                    },
                  ),
                  SizedBox(
                    height: height(context, 19),
                  ),
                  const SalahScreenBody()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
