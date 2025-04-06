import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'details/sura_details_screen1.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentListProvider provider;

  @override
  void initState() {
    /// this code can be execute before build
    super.initState();

    /// this code can be execute after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentListProvider>(context);
    return Visibility(
      visible: provider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          SizedBox(
            width: double.infinity,
            height: height * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.03),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    QuranResources.englishQuranList[
                                        provider.mostRecentList[index]],
                                    style: AppStyles.bold24Black),
                                Text(
                                    QuranResources.arabicQuranList[
                                        provider.mostRecentList[index]],
                                    style: AppStyles.bold24Black),
                                Text(
                                  '${QuranResources.versesNumbersList[provider.mostRecentList[index]]} Verses',
                                  style: AppStyles.bold14Black,
                                ),
                              ]),
                        ),
                        Image.asset(AppAssets.mostRecently)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        SuraDetailsScreen1.routeName,
                        arguments: provider.mostRecentList[index]);
                  },
                );
              },
              itemCount: provider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
