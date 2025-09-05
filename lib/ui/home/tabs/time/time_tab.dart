import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/ui/home/tabs/time/time_item.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'azkar.dart';
import 'azkar_list.dart';
import 'cubit/pray_time_states.dart';
import 'cubit/time_view_model.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  final TimeViewModel viewModel = TimeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchPrayTimes();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<TimeViewModel, PrayTimeState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is PrayTimeLoadingState) {
                return const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.goldColor));
              } else if (state is PrayTimeErrorState) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      state.error,
                      style: AppStyles.bold16White,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              } else if (state is PrayTimeSuccessState) {
                return Container(
                  margin: EdgeInsets.all(5),
                  width: width * 0.92,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.goldColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.brownColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Pray Time', style: AppStyles.bold16White),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30)),
                                color: AppColors.goldColor,
                              ),
                              child: Column(
                                children: [
                                  Text('Pray Time',
                                      style: AppStyles.bold14Black),
                                  Text(DateFormat('E').format(DateTime.now()),
                                      style: AppStyles.bold14Black),
                                ],
                              ),
                            ),
                            Text('Pray Time', style: AppStyles.bold16White),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height * .025),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            enlargeFactor: 0.22,
                            viewportFraction: 0.33,
                            enlargeCenterPage: true,
                            height: height * 0.14,
                          ),
                          items: List.generate(5, (index) => index).map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                                  child: TimeItem(
                                    index: i,
                                    prayTimeList: viewModel.prayTimeList,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Text(
                        currentIndex < viewModel.prayTimeList.length - 1
                            ? 'Next Pray ${viewModel.prayTimeList[currentIndex + 1].prayClock}'
                            : 'No more prayers today',
                        style: AppStyles.bold16Black,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("Something went wrong."));
              }
            },
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text('Azkar', style: AppStyles.bold20White),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Azkarlist.routeName,
                    arguments: 'أذكار الصباح',
                  );
                },
                child: Azkar(
                  azkarIcon: AppAssets.morningAzkar,
                  azkarName: 'Morning Azkar',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Azkarlist.routeName,
                    arguments: 'أذكار المساء',
                  );
                },
                child: Azkar(
                  azkarIcon: AppAssets.eveningAzkar,
                  azkarName: 'Evening Azkar',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}