import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeth.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../../utils/app_colors.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethItem(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(image: AssetImage(AppAssets.hadethCardBG)),
      ),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.hadethCornerLeft,
                      width: width * 0.15,
                    ),
                    Expanded(
                      child: Text(
                        hadeth?.title ?? '',
                        textAlign: TextAlign.center,
                        style: AppStyles.bold24black,
                      ),
                    ),
                    Image.asset(
                      AppAssets.hadethCornerRight,
                      width: width * 0.15,
                    ),
                  ],
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth?.content ?? '',
                      style: AppStyles.bold16white.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Image.asset(AppAssets.hadethMosque, width: double.infinity),
              ],
            ),
    );
  }

  void loadHadethItem(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/Hadeeth/h$index.txt',
    );
    int fileLinesIndex = fileContent.indexOf('\n');

    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }
}
