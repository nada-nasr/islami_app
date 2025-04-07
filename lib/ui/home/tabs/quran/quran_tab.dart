import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/most_recent_widget.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_list_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../providers/most_recent_provider.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';
import 'details/sura_details_screen1.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterIndicesList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<MostRecentListProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newText) {
              filterListByNewText(newText);
            },
            style: AppStyles.bold16White,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 2)),
              prefixIcon: ImageIcon(AssetImage(AppAssets.searchIcon),
                  color: AppColors.primaryColor),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
            ),
          ),
          SizedBox(height: height * 0.02),
          MostRecentWidget(),
          SizedBox(height: height * 0.01),
          Text('Suras List', style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: SuraListWidget(index: filterIndicesList[index]),
                    onTap: () {
                      /// save last sura index
                      provider.updateMostRecentIndicesList(
                          filterIndicesList[index]);
                      Navigator.of(context).pushNamed(
                          SuraDetailsScreen1.routeName,
                          arguments: filterIndicesList[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.whiteColor,
                    thickness: 1,
                    indent: width * 0.09,
                    endIndent: width * 0.05,
                  );
                },
                itemCount: filterIndicesList.length),
          )
        ],
      ),
    );
  }

  void filterListByNewText(String newText) {
    List<int> filterList = [];

    /// result search
    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      if (QuranResources.englishQuranList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterList.add(i);
      } else if (QuranResources.arabicQuranList[i].contains(newText)) {
        filterList.add(i);
      }
      filterIndicesList = filterList;
      setState(() {});
    }
  }
}

/// screen width = 430
/// screen height = 932
