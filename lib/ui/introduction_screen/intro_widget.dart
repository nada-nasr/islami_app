import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

class IntroWidget extends StatelessWidget {
  String imagePath;
  String title;
  String description;

  IntroWidget({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(imagePath, height: height * 0.44, width: width * 0.96),
          SizedBox(height: height * 0.04),
          Container(
            height: height * 0.04,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.bold24Primary,
            ),
          ),
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyles.bold20Primary,
            ),
          ),
        ],
      ),
    );
  }
}
