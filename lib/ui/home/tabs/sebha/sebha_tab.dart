import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {

  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turn = 0.0;
  int counter = 0;

  int tasbihIndex = 0;
  List<String> tasbih = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;


    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: AppStyles.bold36white,
        ),
        SizedBox(height: height * 0.09),
        Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                  onTap: onSebhaTapped,
                  child: AnimatedRotation(
                    turns: turn,
                    duration: const Duration(milliseconds: 250),
                    // Animation speed
                    child: Image.asset(
                      AppAssets.sebhaImage,
                    ),
                  )
              ),
              Column(
                children: [
                  SizedBox(height: height * 0.1,),
                  Text(
                    tasbih[tasbihIndex],
                    style: AppStyles.bold36white,
                  ),
                  SizedBox(height: height * 0.02,),
                  Text(
                    '$counter',
                    style: AppStyles.bold36white,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  void onSebhaTapped() {
    turn += 0.05;
    counter++;

    if (counter > 33) {
      counter = 0;
      tasbihIndex++;
      if (tasbihIndex == tasbih.length) {
        tasbihIndex = 0;
      }
    }
    setState(() {

    });
  }

}



