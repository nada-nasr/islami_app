import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefs_utils.dart';

class MostRecentListProvider extends ChangeNotifier {
  /// data
  List<int> mostRecentList = [];

  /// read data
  void refreshMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
    //todo: List<String> => List<int>
    mostRecentList =
        mostRecentIndicesAsString.map((element) => int.parse(element)).toList();

    /// or with add(): return mostRecentIndicesAsInt.reversed.toList();
    notifyListeners();

    /// send notification to listeners
  }

  /// write data
  void updateMostRecentIndicesList(int newSuraIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesList =
        prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
    if (mostRecentIndicesList.contains('$newSuraIndex')) {
      /// duplicate
      mostRecentIndicesList.remove('$newSuraIndex');

      /// remove from list
      mostRecentIndicesList.insert(0, '$newSuraIndex');
    } else {
      mostRecentIndicesList.insert(0, '$newSuraIndex');
    }
    if (mostRecentIndicesList.length > 5) {
      mostRecentIndicesList.removeLast();

      ///mostRecentIndicesList = mostRecentIndicesList.sublist(0,5);
    }
    await prefs.setStringList(PrefKeys.mostRecentKey, mostRecentIndicesList);
  }
}
