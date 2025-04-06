import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/utils/app_assets.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: height * 0.01),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Image.asset(AppAssets.hadethContentBg,
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        hadeth == null
            ? Center(
                child: CircularProgressIndicator(color: AppColors.blackBgColor))
            : Container(
                height: height * 0.56,

                ///440
                child: Column(
                  children: [
                    Container(
                      width: width * 0.60,
                      margin: EdgeInsets.only(
                          top: height * 0.04, bottom: height * 0.02),
                      alignment: Alignment.topCenter,
                      child: Expanded(
                        child: Text(
                          hadeth?.title ?? "",
                          style: AppStyles.bold24Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: width * 1.59,
                          padding: EdgeInsets.only(
                              right: width * 0.03, left: width * 0.03),
                          child: Text(
                            hadeth?.content ?? "",
                            style: AppStyles.bold14Black.copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
      ]),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/hadeeth/h$index.txt');
    String title = fileContent.substring(0, fileContent.indexOf('\n'));

    /// لحد ال n\
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);

    /// من بعد ال n\
    hadeth = Hadeth(title: title, content: content);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
