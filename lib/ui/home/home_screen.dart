import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backGroundImages = [
    AppAssets.quranBG,
    AppAssets.hadethBG,
    AppAssets.sebhaBG,
    AppAssets.radioBG,
    AppAssets.timeBG
  ];
  List<Widget> tabs = [
    QuranTab(), HadethTab(), SebhaTab(), RadioTab(), TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //background for tabs
        Image.asset(
          backGroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 0, iconPath: AppAssets.iconQuran),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 1, iconPath: AppAssets.iconHadeth),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 2, iconPath: AppAssets.iconSebha),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 3, iconPath: AppAssets.iconRadio),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationBar(
                          index: 4, iconPath: AppAssets.iconTime),
                      label: 'Time'),
                ]
            ),
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.logo),
                Expanded(child: tabs[selectedIndex])
              ]

          ),

        ),
      ],
    );
  }

  Widget builtBottomNavigationBar(
      {required int index, required String iconPath}) {
    return selectedIndex == index ?
    Container(
      padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppColors.blackBgColor,
      ),
      child: ImageIcon(
          AssetImage(iconPath)
      ),
    ) :
    ImageIcon(
        AssetImage(iconPath)
    );

  }
}

