import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoshafListScreen extends StatelessWidget {
  const MoshafListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
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
                    const AppBarMoshafList(),
                    SizedBox(
                      height: height(context, 19),
                    ),
                    const MoshafListScreen(),
                    SizedBox(
                      height: height(context, 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
