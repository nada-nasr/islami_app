import 'package:flutter/material.dart';

import '../../../../../utils/app_styles.dart';

class SuraContent1 extends StatelessWidget {
  String suraContent;

  SuraContent1({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    return Text(
      suraContent,
      style: AppStyles.bold20Primary,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
