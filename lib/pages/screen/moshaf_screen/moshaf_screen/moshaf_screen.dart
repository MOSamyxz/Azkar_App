import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/data/model/moshaf_model.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          floatingActionButton: MoshafScreenFAB(currentPage: currentPage),
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

                        return MoshafPageItem(
                          filteredTexts: filteredTexts,
                          pageNum: pageNum,
                          i: i,
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
