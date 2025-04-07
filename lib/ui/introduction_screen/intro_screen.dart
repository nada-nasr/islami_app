import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/introduction_screen/intro_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'intro_screen';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  List<Widget> pages = [
    IntroWidget(
      imagePath: 'assets/images/welcom.png',
      title: '',
      description: 'Welcome To Islami App',
    ),
    IntroWidget(
      imagePath: 'assets/images/mosque.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    IntroWidget(
      imagePath: 'assets/images/quran.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    IntroWidget(
      imagePath: 'assets/images/Bearish.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    IntroWidget(
      imagePath: 'assets/images/radio.png',
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/intro_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) => pages[index],
              ),
              currentIndex == 0
                  ? SizedBox.shrink()
                  : Positioned(
                    bottom: height * 0.01,
                    left: width * 0.02,
                    child: TextButton(
                      child: Text('Back', style: AppStyles.bold16Primary),
                      onPressed: () {
                        onClickBack();
                      },
                    ),
                  ),
              Positioned(
                bottom: height * 0.01,
                right: width * 0.02,
                child: TextButton(
                  child: Text(
                    currentIndex == pages.length - 1 ? "Finish" : "Next",
                    style: AppStyles.bold16Primary,
                  ),
                  onPressed: () {
                    onClickNext();
                  },
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(bottom: height * 0.04),
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: pages.length,
                    effect: WormEffect(
                      dotHeight: height * 0.007,
                      dotWidth: width * 0.016,
                      dotColor: AppColors.grayColor,
                      activeDotColor: AppColors.goldColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onClickNext() {
    if (currentIndex < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      onClickFinish();
    }
  }

  void onClickFinish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void onClickBack() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutBack,
      );
    }
  }
}
