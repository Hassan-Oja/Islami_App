import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_content.dart';
import 'package:islami/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getMostRecentSuraList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        // actions: [
        //   InkWell(
        //     child: Icon(Icons.change_circle),
        //     onTap: () {
        //       Navigator.of(context).pushNamed(SuraDetailsScreen2.routName) ;
        //     },
        //   )
        // ],
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColors.blackBgColor,
        title: Text(
          QuranResources.englishQuranList[index],
          style: AppStyles.bold20primary,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
        color: AppColors.blackColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.cornerLeft),
                Text(
                  QuranResources.arabicQuranList[index],
                  style: AppStyles.bold20primary,
                ),
                Image.asset(AppAssets.cornerright),
              ],
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02);
                      },
                      itemBuilder: (context, index) {
                        return SuraContent(
                          content: verses[index],
                          index: index,
                        );
                      },
                      itemCount: verses.length,
                    ),
            ),
            Image.asset(AppAssets.mosque),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    verses = lines;
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
