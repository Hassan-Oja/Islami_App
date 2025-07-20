import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  String content;

  int index;

  SuraContent({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Text(
        ' $content [${index + 1}]',
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20primary,
        textAlign: TextAlign.center,
      ),
    );
  }
}
