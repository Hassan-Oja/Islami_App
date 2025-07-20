import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/time/details/azkar_item.dart';
import 'package:islami/ui/home/tabs/time/details/time_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Color(0x9ddd5555),
      // column for full screen
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.timeBGColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('16 Jul \n 2024', style: AppStyles.bold16white),
                        Container(
                          padding: EdgeInsets.only(
                            top: height * 0.004,
                            bottom: height * 0.016,
                            left: width * 0.088,
                            right: width * 0.08,
                          ),
                          child: Text(
                            'Pray Time \n Tuesday',
                            style: AppStyles.bold20black,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                        Text('09 Muh, \n1446', style: AppStyles.bold16white),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: CarouselSlider(
                            items: [
                              TimeWidget(
                                name: 'Fajr',
                                time: '4:20',
                                period: 'AM',
                              ),
                              TimeWidget(
                                name: 'Sunrise',
                                time: '6:06',
                                period: 'AM',
                              ),
                              TimeWidget(
                                name: 'Dhuhr',
                                time: '1:06',
                                period: 'PM',
                              ),
                              TimeWidget(
                                name: 'ASR',
                                time: '4:45',
                                period: 'PM',
                              ),
                              TimeWidget(
                                name: 'Maghrib',
                                time: '8:06',
                                period: 'PM',
                              ),
                              TimeWidget(
                                name: 'Isha',
                                time: '9:39',
                                period: 'PM',
                              ),
                            ],
                            options: CarouselOptions(
                              height: 150.0,
                              viewportFraction: 0.4,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.07,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Next Pray - 02:32',
                                style: AppStyles.bold16black,
                              ),
                              SizedBox(width: width * 0.16),
                              Image.asset(AppAssets.muteIcon),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(children: [Text('Azkar', style: AppStyles.bold16white)]),
            Row(
              children: [
                AzkarItem(title: 'Morning Azkar', path: AppAssets.morningAzkar),
                SizedBox(width: width * 0.04),
                AzkarItem(title: 'Evening Azkar', path: AppAssets.eveningAzkar),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
