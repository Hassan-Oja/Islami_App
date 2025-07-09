import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/sura_item.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
              cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      width: 2,
                      color: AppColors.primaryColor
                  )
              ),
              prefixIcon: Image.asset(AppAssets.searchIcon),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16white,

            )
          ),
          SizedBox(height: height * 0.02,),
          Text(
            'Most Recently',
            style: AppStyles.bold16white,
          ),
          SizedBox(height: height * 0.01,),
          Container(
            height: height * 0.15,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Al-Anbiya', style: AppStyles.bold24black,),
                            Text('الأنبياء', style: AppStyles.bold24black,),
                            Text('112 Verses  ', style: AppStyles.bold14black,),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecently)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: width * 0.02,);
                },
                itemCount: 10
            ),
          ),
          SizedBox(height: height * 0.02,),
          Text(
            'Suras List',
            style: AppStyles.bold16white,
          ),
          SizedBox(height: height * 0.02,),
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return SuraItem(index: index,);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.whiteColor,
                      thickness: 2,
                      indent: width * 0.1,
                      endIndent: width * 0.1,
                    );
                  },
                  itemCount: 114
              )
          )
        ],
      ),
    );
  }
}
