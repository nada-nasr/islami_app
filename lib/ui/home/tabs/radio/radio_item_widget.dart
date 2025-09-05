/*import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_view_model.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class RadioItemWidget extends StatelessWidget {
   RadioItemWidget({super.key});
  RadioViewModel radioViewModel = RadioViewModel();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView.separated(
      padding: EdgeInsets.only(right: width * 0.002, bottom: height * 0.006),
      itemCount: radioViewModel.radio.length,
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
                child: Image.asset(AppAssets.radioContentBg,
                    width: double.infinity, fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      radioViewModel.radio[index].name,
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
                              child: Image.asset(radioViewModel.radio[index].playIcon,
                                  height: height * 0.04),
                              onTap: () {},
                            ),
                            SizedBox(width: width * 0.05),
                            GestureDetector(
                              child: Image.asset(radioViewModel.radio[index].volumeIcon,
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
    );
  }
}
*/
