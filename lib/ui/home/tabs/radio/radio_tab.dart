import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio/item_widget.dart';

import 'radio_or_reciters_widget.dart';

class RadioTab extends StatelessWidget {

  RadioTab({super.key});

  List<int> widgets = List.generate(10, (index) => index);

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

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: RadioOrRecitersWidget(
                      title: 'Radio', isSelected: true,)
                ),
                SizedBox(width: width * 0.02,),
                Expanded(
                    child: RadioOrRecitersWidget(title: 'Reciters')
                )
              ],

            ),
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ItemWidget(text: 'Radio');
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.01,);
                },
                itemCount: widgets.length
            ),
          )
        ],
      ),
    );
  }
}
