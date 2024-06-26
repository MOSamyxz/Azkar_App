import 'package:azkar/core/constants/size.dart';
import 'package:azkar/pages/screen/salah_screen/salah_cubit/salah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          BlocProvider.of<SalahCubit>(context).city,
          style: TextStyle(
              fontFamily: 'Gamila', fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: width(context, 10),
        ),
        const Icon(Icons.location_on)
      ],
    );
  }
}
