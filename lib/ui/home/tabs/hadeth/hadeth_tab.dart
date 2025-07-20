import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.03),
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: height * 0.66,
        ),
        items: List.generate(50, (index) => index + 1,).map((index) {
          return HadethItem(index: index);
        }).toList(),
      ),
    );
  }
}
