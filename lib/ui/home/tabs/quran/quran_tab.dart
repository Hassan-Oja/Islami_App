import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/details/most_recent_widget.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/sura_item.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyles.bold20white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
              ),
              prefixIcon: Image.asset(AppAssets.searchIcon),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16white,
            ),
            onChanged: (newtext) {
              searchByNewText(newtext);
            },
          ),
          SizedBox(height: height * 0.02),
          MostRecentWidget(),
          SizedBox(height: height * 0.02),
          Text('Suras List', style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // todo : save last sura index in preferences
                    saveNewSuraList(filterList[index]);
                    //todo: navigate to sura-details-screen
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: width * 0.1,
                  endIndent: width * 0.1,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchByNewText(String newtext) {
    List<int> resultSearchList = [];
    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      if (QuranResources.englishQuranList[i].toLowerCase().contains(
        newtext.toLowerCase(),
      )) {
        resultSearchList.add(i);
      }
      if (QuranResources.arabicQuranList[i].toLowerCase().contains(
        newtext.toLowerCase(),
      )) {
        resultSearchList.add(i);
      }
    }
    filterList = resultSearchList;
    setState(() {});
  }
}
