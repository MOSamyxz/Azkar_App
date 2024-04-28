import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';

class AzkarBuildItem extends StatelessWidget {
  const AzkarBuildItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.mainBody,
    required this.disc,
    required this.leanght,
    required this.counter,
    required this.count,
    this.needButton = false,
    this.textButton,
    this.onTapButton,
  });

  final int index;
  final int leanght;
  final int counter;
  final int count;
  final String mainBody;
  final String disc;
  final void Function() onTap;
  final bool needButton;
  final String? textButton;
  final void Function()? onTapButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppCard.zekr(
          context: context,
          child: Padding(
            padding: EdgeInsets.only(
                left: width(context, 12),
                right: width(context, 12),
                top: height(context, 40),
                bottom: height(context, 20)),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Column(
                        children: [
                          CustomMainBody(mainBody: mainBody, index: index),
                          SizedBox(
                            height: height(context, 5),
                          ),
                          needButton
                              ? MaterialButton(
                                  elevation: 0,
                                  color: AppColors.mainClr,
                                  onPressed: onTapButton,
                                  //return false when click on "NO"
                                  child: Text(
                                    textButton ?? '',
                                    style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        fontFamily: 'KFGQPC',
                                        color: Colors.white),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: height(context, 5),
                          ),
                          const Divider(
                            color: AppColors.mainClr,
                          ),
                          SizedBox(
                            height: height(context, 20),
                          ),
                          CustomDiscText(disc: disc, index: index),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomProgressCircle(
                  index: index,
                  aLeanght: '$leanght',
                  count: count,
                  counter: counter,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
