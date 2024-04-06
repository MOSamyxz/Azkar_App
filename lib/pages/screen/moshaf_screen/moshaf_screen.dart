import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/constants.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/data/model/moshaf_model.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoshafScreen extends StatefulWidget {
  const MoshafScreen({super.key, required this.targetPage});
  final int targetPage;

  @override
  State<MoshafScreen> createState() => _MoshafScreenState();
}

class _MoshafScreenState extends State<MoshafScreen> {
  int currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(widget.targetPage - 1);
    });
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: BlocProvider.of<ThemeCubit>(context).isDark
                ? const Color.fromARGB(255, 86, 86, 86)
                : const Color.fromARGB(255, 246, 234, 209),
            onPressed: () {
              BlocProvider.of<AzkarCubit>(context).savePage(currentPage + 1);
              BlocProvider.of<AzkarCubit>(context).loadPage();
              Fluttertoast.showToast(
                msg: ' تم الحفظ',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
            child: BlocProvider.of<AzkarCubit>(context).savedPage ==
                    currentPage + 1
                ? const Icon(
                    Icons.bookmark_added,
                    color: AppColors.mainClr,
                  )
                : const Icon(
                    Icons.bookmark_add,
                    color: AppColors.mainClr,
                  ),
          ),
          body: Stack(
            children: [
              const Background(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width(context, 6)),
                decoration: BoxDecoration(
                  color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? const Color.fromARGB(255, 71, 71, 71)
                      : const Color(0xffFCF6EA),
                ),
                child: SafeArea(
                  child: PageView.builder(
                      onPageChanged: (index) {
                        currentPage = index;
                        BlocProvider.of<AzkarCubit>(context)
                            .saveHPage(index + 1);
                        BlocProvider.of<AzkarCubit>(context).loadHPage();
                      },
                      reverse: true,
                      controller: _pageController,
                      itemCount: 604,
                      itemBuilder: (context, i) {
                        int num = i + 1;
                        var pageNum = num.toArabicNumbers;
                        List<MoshafModel> filteredTexts =
                            BlocProvider.of<AzkarCubit>(context)
                                .moshafList
                                .where((map) => map.page == i + 1)
                                .toList();

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          BlocProvider.of<ThemeCubit>(context)
                                                  .isDark
                                              ? const Color.fromARGB(
                                                  255, 71, 71, 71)
                                              : const Color(0xffFCF6EA),
                                    ),
                                    child: Text(
                                      surahNames[i],
                                      style: TextStyle(
                                          fontFamily: 'HafsSmart_08',
                                          fontSize: 14,
                                          color: BlocProvider.of<ThemeCubit>(
                                                      context)
                                                  .isDark
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:
                                            BlocProvider.of<ThemeCubit>(context)
                                                    .isDark
                                                ? const Color.fromARGB(
                                                    255, 71, 71, 71)
                                                : const Color(0xffFCF6EA),
                                      ),
                                      child: Text(
                                        jozzName[i],
                                        style: TextStyle(
                                            fontFamily: 'HafsSmart_08',
                                            fontSize: 14,
                                            color: BlocProvider.of<ThemeCubit>(
                                                        context)
                                                    .isDark
                                                ? Colors.white
                                                : Colors.black),
                                      )),
                                ],
                              ),
                              i == 0
                                  ? SizedBox(
                                      height: height(context, 250),
                                    )
                                  : i == 1
                                      ? SizedBox(
                                          height: height(context, 200),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Column(children: [
                                        Text(
                                          filteredTexts
                                              .map((map) => '${map.ayaText}')
                                              .join(' '),
                                          style: TextStyle(
                                              fontFamily: 'HafsSmart_08',
                                              fontSize: 22,
                                              color:
                                                  BlocProvider.of<ThemeCubit>(
                                                              context)
                                                          .isDark
                                                      ? Colors.white
                                                      : Colors.black),
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: width(context, 10),
                                                right: width(context, 14.5)),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  AppImages.frame,
                                                  width: width(context, 50),
                                                  height: height(context, 50),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 0),
                                                  child: Text(
                                                    pageNum,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'DG_Kufi',
                                                        color: BlocProvider.of<
                                                                        ThemeCubit>(
                                                                    context)
                                                                .isDark
                                                            ? Colors.white
                                                            : Colors.black),
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ))
                                      ])),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height(context, 30),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
