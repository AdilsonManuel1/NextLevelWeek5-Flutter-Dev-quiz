
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widget/progress_indicatior/progress_indicatior.%C2%AB_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndication extends StatelessWidget {

  final int currentPage;
  final int lenght;
  const QuestionIndication({Key? key, required this.currentPage, required this.lenght}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("Questão $currentPage",
          style: AppTextStyles.body,),
          Text("de $lenght",style: AppTextStyles.body,),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicaorWidget(
            value:currentPage /lenght,
          )
        ],
      ),
    );
  }
}