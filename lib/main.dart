import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/details/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/time/azkar_list.dart';
import 'package:islami_app/ui/introduction_screen/intro_screen.dart';
import 'package:islami_app/ui/splash_screen.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:islami_app/utils/bloc_observer.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentListProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,

      ///SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen1.routeName: (context) => SuraDetailsScreen1(),
        ///SuraDetailsScreen2.routeName: (context) => SuraDetailsScreen2(),
        Azkarlist.routeName: (context) => Azkarlist(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
