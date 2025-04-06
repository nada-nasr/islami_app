import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_data.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

import '../../../../utils/app_styles.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with TickerProviderStateMixin {
  List<RadioData> radio = [
    RadioData(
        name: 'Ibrahim Al-Akdar',
        playIcon: AppAssets.playIcon,
        volumeIcon: AppAssets.volumeHigh),
    RadioData(
      name: 'Al-Qaria Yassen',
      playIcon: AppAssets.pauseIcon,
      volumeIcon: AppAssets.volumeCross,
    ),
    RadioData(
        name: 'Ahmed Al-trabulsi',
        playIcon: AppAssets.playIcon,
        volumeIcon: AppAssets.volumeHigh),
    RadioData(
        name: 'Addokali Mohammad Alalim',
        playIcon: AppAssets.playIcon,
        volumeIcon: AppAssets.volumeHigh),
  ];

  List<RadioData> reciters = [
    RadioData(
        name: 'Ibrahim Al-Akdar',
        playIcon: AppAssets.playIcon,
        volumeIcon: AppAssets.volumeHigh),
    RadioData(
        name: 'Akram Alalaqmi',
        playIcon: AppAssets.pauseIcon,
        volumeIcon: AppAssets.volumeCross),
    RadioData(
        name: 'Majed Al-Enezi',
        playIcon: AppAssets.playIcon,
        volumeIcon: AppAssets.volumeHigh),
    RadioData(
        name: 'Mishary Al-Afasy',
        playIcon: AppAssets.playIcon,
        volumeIcon: AppAssets.volumeHigh),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TabController tabController = TabController(length: 2, vsync: this);
    return Column(children: [
      Expanded(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(children: [
          Container(
            height: height * 0.05,
            width: width,
            margin: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
            decoration: BoxDecoration(
                color: AppColors.blackBgColor,
                borderRadius: BorderRadius.circular(12)),
            child: TabBar(
                dividerHeight: 0,
                controller: tabController,
                indicatorColor: AppColors.primaryColor,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
                labelStyle: AppStyles.bold16Black,

                /// Active tab label color
                unselectedLabelStyle: AppStyles.bold16White,

                /// Inactive tab label color
                tabs: [
                  Tab(
                      child: Center(
                          child: Text('Radio', textAlign: TextAlign.center))),
                  Tab(
                    child: Center(
                        child: Text('Reciters', textAlign: TextAlign.center)),
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              /// radio
              ListView.separated(
                padding: EdgeInsets.only(
                    right: width * 0.002, bottom: height * 0.006),
                itemCount: radio.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            AppAssets.radioContentBg,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Radio ${radio[index].name}',
                                style: AppStyles.bold20Black,
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: width * 0.15),
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Image.asset(
                                            radio[index].playIcon,
                                            height: height * 0.04),
                                        onTap: () {},
                                      ),
                                      SizedBox(width: width * 0.05),
                                      GestureDetector(
                                        child: Image.asset(
                                            radio[index].volumeIcon,
                                            height: height * 0.04),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.02);
                },
              ),

              /// reciters
              ListView.separated(
                padding: EdgeInsets.only(
                    right: width * 0.002, bottom: height * 0.006),
                itemCount: reciters.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            AppAssets.radioContentBg,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                reciters[index].name,
                                style: AppStyles.bold20Black,
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: width * 0.15),
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Image.asset(
                                            reciters[index].playIcon,
                                            height: height * 0.04),
                                        onTap: () {},
                                      ),
                                      SizedBox(width: width * 0.05),
                                      GestureDetector(
                                        child: Image.asset(
                                            reciters[index].volumeIcon,
                                            height: height * 0.04),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.02);
                },
              ),
            ]),
          ),
        ]),
      )),
    ]);
  }
}
