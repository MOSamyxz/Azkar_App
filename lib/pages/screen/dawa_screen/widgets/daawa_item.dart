import 'package:azkar/pages/screen/dawa_screen/daawa_cubit/daawa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/size.dart';
import '../../../../core/constants/strings.dart';
import '../../../../data/model/daawa_model.dart';

class DaawaItem extends StatelessWidget {
  const DaawaItem({
    super.key,
    required this.daawaModel,
    required this.index,
  });

  final List<DaawaModel> daawaModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DaawaCubit(),
      child: BlocBuilder<DaawaCubit, DaawaState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: height(context, 10)),
                width: width(context, 350),
                height: height(context, 184),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(daawaModel[index].image),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: width(context, 350),
                height: height(context, 184),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.2),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<DaawaCubit>(context)
                              .launchYouTubeChannel(
                                  daawaModel[index].channelId);
                        },
                        child: Image.asset(
                          AppStrings.daawaButton,
                          width: width(context, 65),
                          height: height(context, 65),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            daawaModel[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Gamila',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
