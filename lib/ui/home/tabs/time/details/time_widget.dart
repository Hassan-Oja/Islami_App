import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class TimeWidget extends StatelessWidget {
  String name;
  String time;
  String period;

  TimeWidget({
    super.key,
    required this.name,
    required this.period,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.balck, AppColors.primaryColor],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: width * 0.02,
          horizontal: height * 0.01,
        ),
        child: Column(
          children: [
            Text(name, style: AppStyles.bold16white),
            Text(time, style: AppStyles.bold36white),
            Text(period, style: AppStyles.bold16white),
          ],
        ),
      ),
    );
  }
}
