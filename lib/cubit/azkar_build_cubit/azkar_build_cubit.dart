import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'azkar_build_state.dart';

class AzkarBuildCubit extends Cubit<AzkarBuildState> {
  AzkarBuildCubit() : super(AzkarBuildInitial());
  late int aLength;
  late int currentPageIndex = 0;
  late final List<int> counters = List.generate(aLength, (_) => 0);
  late PageController pageController;

  void initState(BuildContext context, int i) {
    aLength = i;
    pageController = PageController(
        initialPage: currentPageIndex, keepPage: true, viewportFraction: 1);
  }

  void incrementCounter(context, int aLength, int aCount, String body) {
    emit(CounterInitialState());
    counters[currentPageIndex]++;
    emit(IncrementState());
    if (currentPageIndex < aLength - 1 &&
        counters[currentPageIndex] == aCount) {
      currentPageIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
      emit(PageChangedState());
    } else if (currentPageIndex == aLength - 1 &&
        counters[currentPageIndex] == aCount) {
      showAlertDialog(
        context,
        'تقبل الله منا ومنكم صالح الاعمال ..! \n لقد أنهيت $body',
      );
    }
  }

  Future<void> showAlertDialog(context, String body) async {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: AppCard.dialog(
          context: context,
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            alignment: Alignment.center,
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: height(context, 100),
                      child: Text(body,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'KFGQPC',
                              color: AppColors.mainClr)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          elevation: 0,

                          color: AppColors.mainClr,
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);
                          },
                          //return false when click on "NO"
                          child: const Text(
                            'الخروج',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontFamily: 'KFGQPC',
                                color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: BlocProvider.of<ThemeCubit>(context).isDark
                              ? const Color.fromARGB(255, 71, 71, 71)
                              : AppColors.accentClr,
                          shape: Border.all(
                            color: AppColors.mainClr.withOpacity(0.3),
                          ),
                          elevation: 0,

                          onPressed: () => Navigator.of(context).pop(false),
                          //return true when click on "Yes"
                          child: const Text(
                            'البقاء',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontFamily: 'KFGQPC',
                                color: AppColors.mainClr),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context, aLength, aCounte) async {
    if (currentPageIndex == aLength - 1 && counters[aLength - 1] == aCounte) {
      Navigator.of(context).pop(true);
    } else {
      return await showDialog(
            context: context,
            builder: (context) => Center(
              child: AppCard.dialog(
                context: context,
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  alignment: Alignment.center,
                  content: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: height(context, 100),
                            child: const Text(
                                'انت لم تنتهي بعد \n هل انت متأكد من رغبتك بالخروج ؟',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontFamily: 'KFGQPC',
                                    color: AppColors.mainClr)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                elevation: 0,

                                color: AppColors.mainClr,
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                  Navigator.of(context).pop(true);
                                },
                                //return false when click on "NO"
                                child: const Text(
                                  'الخروج',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily: 'KFGQPC',
                                      color: Colors.white),
                                ),
                              ),
                              MaterialButton(
                                color:
                                    BlocProvider.of<ThemeCubit>(context).isDark
                                        ? const Color.fromARGB(255, 71, 71, 71)
                                        : AppColors.accentClr,
                                shape: Border.all(
                                  color: AppColors.mainClr.withOpacity(0.3),
                                ),
                                elevation: 0,

                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                //return true when click on "Yes"
                                child: const Text(
                                  'البقاء',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily: 'KFGQPC',
                                      color: AppColors.mainClr),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ) ??
          false;
    }
    return false; //if showDialouge had returned null, then return false
  }
}
