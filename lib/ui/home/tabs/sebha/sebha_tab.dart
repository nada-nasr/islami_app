import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';

import '../../../../utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int iteration = 0;
  double turns = 0.0;
  List<String> azkar = [
    'سُبْحَانَ اللهِ',
    'الْحَمْدُ لِلَّهِ',
    'لَا إِلَهَ إِلَّا اللَّه',
    'اللَّهُ أَكْبَرُ',
    'لا حَوْلَ وَلا قُوَّةَ إِلا باللَّه'
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: height * 0.03),
          child: Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: AppStyles.bold30White,
            textAlign: TextAlign.center,
          ),
        ),
        Stack(children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: width * 0.16),
                child: Image.asset(AppAssets.sebhaHead, width: 73, height: 80),
              ),
              GestureDetector(
                child: AnimatedRotation(
                  turns: turns,
                  duration: Duration(seconds: 1),
                  child: Image.asset(AppAssets.sebhaBody,
                      width: width, height: height * 0.4),
                ),
                onTap: () {
                  setState(() {
                    turns += 1 / 9;
                    increaseCounter();
                  });
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.26),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(currentZekr(),
                      style: AppStyles.bold30White,
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text('$counter',
                      style: AppStyles.bold36White, textAlign: TextAlign.center)
                ]),
          )
        ])
      ]),
    );
  }

  void increaseCounter() {
    setState(() {
      counter++;
      if (counter == 33) {
        iteration++;
        counter = 0;
        if (iteration >= azkar.length) {
          iteration = 0;
        }
      }
    });
  }

  String currentZekr() {
    if (azkar.isNotEmpty && iteration < azkar.length) {
      return azkar[iteration];
    }
    return '';
  }
}
