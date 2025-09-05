import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class AzkarItem extends StatefulWidget {
  final int index;
  final String category; // "أذكار الصباح" أو "أذكار المساء"

  const AzkarItem({super.key, required this.index, required this.category});

  @override
  State<AzkarItem> createState() => _AzkarItemState();
}

class _AzkarItemState extends State<AzkarItem> {
  Map<String, dynamic>? azkarData;
  Map<String, dynamic>? azkarItem;

  @override
  void initState() {
    super.initState();
    loadAzkarFromJson(widget.index);
  }

  Future<void> loadAzkarFromJson(int index) async {
    final String jsonString =
        await rootBundle.loadString('assets/azkar/azkar.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    final List<dynamic> azkarList = jsonData[widget.category] ?? [];

    if (index < azkarList.length) {
      final item = azkarList[index];
      if (item is List) {
        // أحياناً العنصر يكون List بداخل List
        azkarItem = item[0];
      } else if (item is Map<String, dynamic>) {
        azkarItem = item;
      }
    }

    setState(() => azkarData = jsonData);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.hadethContentBg)),
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: azkarItem == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.blackColor))
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .02,
                    vertical: height * .005,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          azkarItem?['category'] ?? '',
                          style: AppStyles.bold20Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * .02),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      azkarItem?['content'] ?? '',
                      style: AppStyles.bold16Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if ((azkarItem?['count'] ?? '') != '')
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'التكرار: ${azkarItem!['count']}',
                      style: AppStyles.bold16Black,
                    ),
                  ),
                if ((azkarItem?['description'] ?? '').toString().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      azkarItem!['description'],
                      style:
                          AppStyles.bold16Black.copyWith(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
    );
  }
}
