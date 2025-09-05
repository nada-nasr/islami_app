import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../../model/Radios.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class RadioListWidget extends StatefulWidget {
  final List<RadioItem> radioList;

  const RadioListWidget({super.key, required this.radioList});

  @override
  State<RadioListWidget> createState() => _RadioListWidgetState();
}

class _RadioListWidgetState extends State<RadioListWidget> {
  final AudioPlayer player = AudioPlayer();
  int? playingIndex;
  bool isPlaying = false;
  Map<int, bool> volumeStates = {};

  void togglePlay(int index) async {
    final url = widget.radioList[index].url;
    if (url == null) return;

    if (playingIndex == index && isPlaying) {
      await player.pause();
      setState(() => isPlaying = false);
    } else {
      await player.stop();
      try {
        await player.setSourceUrl(url);
        await player.resume();
        setState(() {
          playingIndex = index;
          isPlaying = true;
        });
      } catch (e) {
        debugPrint("Error playing radio stream: $url\n$e");
      }
    }
  }

  void toggleVolume(int index) async {
    final current = volumeStates[index] ?? true;
    await player.setVolume(current ? 0 : 1);
    setState(() => volumeStates[index] = !current);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: height * 0.008),
      itemCount: widget.radioList.length,
      separatorBuilder: (context, index) => SizedBox(height: height * 0.019),
      itemBuilder: (context, index) {
        final radio = widget.radioList[index];
        final isCurrent = playingIndex == index && isPlaying;
        final isVolumeOpen = volumeStates[index] ?? true;

        return Container(
          padding: EdgeInsets.only(top: height * 0.01),
          width: width * 0.8,
          height: height * 0.18,
          decoration: BoxDecoration(
            color: AppColors.goldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                radio.name ?? 'No Name',
                style: AppStyles.bold16Black,
                overflow: TextOverflow.ellipsis,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppAssets.radioContentBg,
                      color: AppColors.grayColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: width * 0.13),
                      IconButton(
                        icon: Icon(
                          isCurrent
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 44,
                          color: AppColors.blackColor,
                        ),
                        onPressed: () => togglePlay(index),
                      ),
                      IconButton(
                        icon: Icon(
                          isVolumeOpen
                              ? Icons.volume_up_rounded
                              : Icons.volume_off_rounded,
                          size: 44,
                          color: AppColors.blackColor,
                        ),
                        onPressed: () => toggleVolume(index),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
