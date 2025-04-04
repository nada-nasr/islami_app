import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/time/time_tab.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg
  ];
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(backgroundImages[selectedIndex],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
          Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.primaryColor,
                showSelectedLabels: true,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: buildItemInBottomNavBar(
                          index: 0,
                          imageName: AppAssets.iconQuran),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: buildItemInBottomNavBar(
                          index: 1,
                          imageName: AppAssets.iconHadeth),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: buildItemInBottomNavBar(
                          index: 2,
                          imageName: AppAssets.iconSebha),
                      label: 'Tasbeeh'),
                  BottomNavigationBarItem(
                      icon: buildItemInBottomNavBar(
                          index: 3,
                          imageName: AppAssets.iconRadio),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: buildItemInBottomNavBar(
                          index: 4,
                          imageName: AppAssets.iconTime),
                      label: 'Time'),
                ]
            ),
            body: tabsList[selectedIndex],
          ),

        ]);
  }

  Widget buildItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index ?
    Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackBgColor
      ),
      child: ImageIcon(AssetImage(
          imageName
      )),
    ) : ImageIcon(AssetImage(
        imageName));
  }


}

