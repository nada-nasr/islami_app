import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'cubit/time_view_model.dart';

class TimeItem extends StatelessWidget {
  int index;
  List<Pray> prayTimeList;

  TimeItem({super.key, required this.index, required this.prayTimeList});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blackBgColor),
      width: width * .35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            prayTimeList[index].prayName,
            style: AppStyles.bold16White,
          ),
          Text(
            prayTimeList[index].prayClock,
            style: AppStyles.bold20White,
          ),
        ],
      ),
    );
  }
}
