import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class RadioOrRecitersWidget extends StatefulWidget {
  String title;

  bool isSelected;

  RadioOrRecitersWidget({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  State<RadioOrRecitersWidget> createState() => _RadioOrRecitersWidgetState();
}

class _RadioOrRecitersWidgetState extends State<RadioOrRecitersWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isSelected
            ? AppColors.primaryColor
            : AppColors.transparentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      child: Text(
        widget.title,
        style: widget.isSelected
            ? AppStyles.bold14black.copyWith(fontSize: 16)
            : AppStyles.bold16white,
      ),
    );
  }
}
