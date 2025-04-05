import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  int index;

  SuraListWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.suraNum),
              Text(
                '${index + 1}',
                style: AppStyles.bold16White,
              )
            ],
          ),
          SizedBox(width: width * 0.05),
          Column(children: [
            Text(QuranResources.englishQuranList[index],
                style: AppStyles.bold20White),
            Text(
              '${QuranResources.versesNumbersList[index]} Verses',
              style: AppStyles.bold14White,
            )
          ]),
          Spacer(),
          Text(
            QuranResources.arabicQuranList[index],
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
