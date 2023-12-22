import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/azkar_build_cubit/azkar_build_cubit.dart';

class AzkarBuildScreen extends StatelessWidget {
  const AzkarBuildScreen(
      {super.key,
      required this.id,
      required this.catId,
      required this.body,
      required this.azkar});
  final int id;
  final int catId;
  final String body;
  final List<dynamic> azkar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarBuildCubit, AzkarBuildState>(
      builder: (context, state) {
        //PopUp when press back button function
        Future<bool> showExitPopUp() async {
          return BlocProvider.of<AzkarBuildCubit>(context).showExitPopup(
              context, azkar.length, azkar[azkar.length - 1].count!);
        }

        var cubit = BlocProvider.of<AzkarBuildCubit>(context);
        return Scaffold(
            body: WillPopScope(
          onWillPop: showExitPopUp,
          child: Stack(
            children: [
              const Background(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: height(context, 56),
                  ),
                  CustomAppBar(
                    title: body,
                    onTap: () {
                      if (cubit.currentPageIndex == azkar.length - 1 &&
                          cubit.counters[azkar.length - 1] ==
                              azkar[azkar.length - 1].count!) {
                        navigateBack(context);
                      } else {
                        cubit.showAlertDialog(
                          context,
                          'انت لم تنتهي بعد \n هل انت متأكد من رغبتك بالخروج ؟',
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context, 15),
                  ),
                  Expanded(
                    child: PageView.builder(
                      reverse: true,
                      itemCount: azkar.length,
                      controller: cubit.pageController,
                      onPageChanged: (index) {
                        cubit.currentPageIndex = index;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return AzkarBuildItem(
                          index: index,
                          onTap: () {
                            if (cubit.counters[index] < azkar[index].count!) {
                              cubit.incrementCounter(context, azkar.length,
                                  azkar[cubit.currentPageIndex].count!, body);
                            }
                          },
                          disc: azkar[index].description,
                          mainBody: azkar[index].body,
                          count: azkar[index].count!,
                          counter: cubit.counters[index],
                          leanght: azkar.length,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height(context, 10),
                  )
                ],
              ),
            ],
          ),
        ));
      },
    );
  }
}
