import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicaorWidget extends StatelessWidget {
 final double value;
 const ProgressIndicaorWidget ({Key? key, required this.value}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return  LinearProgressIndicator(
                value: value,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),

  );
  }
}