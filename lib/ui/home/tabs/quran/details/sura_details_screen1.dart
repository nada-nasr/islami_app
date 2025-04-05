import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran/details/sura_content1.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_styles.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  static const String routeName = 'suraDetails_screen';

  const SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String suraContent = '';
  late MostRecentListProvider provider;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    provider = Provider.of<MostRecentListProvider>(context);

    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResources.englishQuranList[index],
            style: AppStyles.bold20Primary),
      ),
      body: Stack(children: [
        Container(
          color: AppColors.blackBgColor,
          child: Image.asset(AppAssets.suraDetailsBg,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
        ),
        Container(
          padding: EdgeInsets.only(top: height * 0.02),
          alignment: Alignment.topCenter,
          child: Text(QuranResources.arabicQuranList[index],
              style: AppStyles.bold24Primary),
        ),
        Container(
            height: height * 0.66,
            margin: EdgeInsets.only(
                top: height * 0.10, right: width * 0.04, left: width * 0.04),
            child: suraContent.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor))
                : SingleChildScrollView(
                    child: SuraContent1(suraContent: suraContent)))
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    provider.refreshMostRecentList();
  }

  void loadSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    suraContent = suraLines.join();

    /// بتجمع في string واحد
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
