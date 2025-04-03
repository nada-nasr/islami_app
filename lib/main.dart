import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        ///SplashScreen.routeName: (context) => SplashScreen(),
        ///IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },

      ///darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      /// هو اللي بيحدد انا شغال ايه لكن لو مبعتش بيشتغل زي الموبايل
    );
  }
}
