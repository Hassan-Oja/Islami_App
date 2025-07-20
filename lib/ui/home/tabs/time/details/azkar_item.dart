import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class AzkarItem extends StatelessWidget {
  String path;
  String title;

  AzkarItem({super.key, required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.04,
        ),
        decoration: BoxDecoration(
          border: BoxBorder.all(width: 4, color: AppColors.primaryColor),
          color: AppColors.blackBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.asset(path),
            SizedBox(height: height * 0.002),
            Text(title, style: AppStyles.bold20white),
          ],
        ),
      ),
    );
  }
}
