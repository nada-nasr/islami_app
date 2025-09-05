/*import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_data.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_item_widget.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_view_model.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_styles.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with TickerProviderStateMixin {

  RadioViewModel radioViewModel = RadioViewModel();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TabController tabController = TabController(length: 2, vsync: this);
    return ChangeNotifierProvider(
      create: (context) => radioViewModel,
      child: Column(children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Consumer<RadioViewModel>(
            builder: (context, value, child) {
              return Column(
                  children: [
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
                          unselectedLabelStyle: AppStyles.bold16White,
                          onTap: (value) {
                            radioViewModel.changeRadioTabs(true);
                          },
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
                        RadioItemWidget(),
                        /*ListView.separated(
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
                  ),*/

                        /// reciters
                         RadioItemWidget()
                        /*ListView.separated(
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
                  ),*/
                      ]),
                    ),
                  ]);
            },
          ),
        )),
      ]),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_item.dart';
import 'package:islami_app/ui/home/tabs/radio/reciter_item.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'cubit/radio_tab_states.dart';
import 'cubit/radio_tab_view_model.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
  final RadioTabViewModel radioTabviewModel = RadioTabViewModel();

  @override
  void initState() {
    super.initState();
    radioTabviewModel.fetchReciters();
    radioTabviewModel.fetchRadio();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: radioButton(
                  index: 0,
                  buttonName: 'Radio',
                  onClick: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    radioTabviewModel.fetchRadio();
                  },
                ),
              ),
              SizedBox(width: width * .05),
              Expanded(
                child: radioButton(
                  index: 1,
                  buttonName: 'Reciters',
                  onClick: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    radioTabviewModel.fetchReciters();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<RadioTabViewModel, RadioTabState>(
              bloc: radioTabviewModel,
              builder: (context, state) {
                if (state is RadioTabLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.goldColor));
                } else if (state is RadioTabErrorState) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'حدث خطأ أثناء تحميل القراء.\nيرجى المحاولة لاحقًا.',
                        style: AppStyles.bold16White,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                } else if (state is RadioTabSuccessState) {
                  return RadioListWidget(
                    radioList: state.radios,
                  );
                } else if (state is ReciterTabLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.goldColor));
                } else if (state is ReciterTabErrorState) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'حدث خطأ أثناء تحميل القراء.\nيرجى المحاولة لاحقًا.',
                        style: AppStyles.bold16White,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                } else if (state is ReciterTabSuccessState) {
                  return ReciterListWidget(
                    reciterList: state.reciters,
                  );
                } else {
                  return const Center(child: Text("Something went wrong."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget radioButton({
    required int index,
    required String buttonName,
    required VoidCallback onClick,
  }) {
    final isSelected = selectedIndex == index;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? AppColors.goldColor : AppColors.blackColor,
        foregroundColor:
            isSelected ? AppColors.blackColor : AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onClick,
      child: Text(buttonName),
    );
  }
}
