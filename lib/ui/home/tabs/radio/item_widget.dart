import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class ItemWidget extends StatelessWidget {
  String text;

  ItemWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: 141,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AppAssets.radioMosque),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: AppStyles.bold20black),
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.playSound),
                  SizedBox(width: width * 0.04),
                  Image.asset(AppAssets.volume),
                ],
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ],
      ),
    );
  }
}
