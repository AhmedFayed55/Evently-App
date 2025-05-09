import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_images.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  int currentValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // في مشكلة علشان ال context  فالفانكشن دي بتاخر ال init شوية لحد اول فريم بيتبني من السكرين
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        currentValue = context.locale.languageCode == "ar" ? 1 : 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: currentValue,
      values: [0, 1],
      onChanged: (newValue) {
        setState(() {
          currentValue = newValue;
          if (currentValue == 1) {
            context.setLocale(Locale("ar"));
          } else {
            context.setLocale(Locale("en"));
          }
        });
      },

      iconOpacity: 1,
      style: ToggleStyle(
        borderColor: Theme.of(context).colorScheme.primary,
        indicatorColor: Theme.of(context).colorScheme.primary,
      ),
      iconList: [
        SvgPicture.asset(AppImages.englishIcon, height: 30, width: 30),
        SvgPicture.asset(AppImages.arabicIcon, height: 30, width: 30),
      ],
    );
  }
}
