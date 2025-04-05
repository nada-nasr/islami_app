import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

import '../../../../../utils/app_styles.dart';

class SuraContent2 extends StatelessWidget {
  String suraContent;
  int index;

  SuraContent2({super.key, required this.suraContent, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: height * 0.02),
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.0023),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primaryColor, width: 2)),
        child: Text(
          '$suraContent [${index + 1}]',
          style: AppStyles.bold20Primary,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
      onTap: () {},
    );
  }
}
