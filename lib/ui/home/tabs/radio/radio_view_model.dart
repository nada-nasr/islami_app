/*import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_data.dart';

import '../../../../utils/app_assets.dart';

class RadioViewModel extends ChangeNotifier{
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

  bool isRadioSelected = true;

  changeRadioTabs(bool isRadio){
    if(isRadio == isRadioSelected){
      return;
    }
    isRadioSelected = isRadio;
    notifyListeners();
  }
}*/
