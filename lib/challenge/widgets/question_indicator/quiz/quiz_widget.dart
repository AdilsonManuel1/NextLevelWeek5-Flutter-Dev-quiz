import 'package:devquiz/challenge/widgets/question_indicator/awnser/awser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widget/progress_indicatior/models/awser_model.dart';
import 'package:devquiz/shared/widget/progress_indicatior/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidgwt extends StatefulWidget {
 final ValueChanged<bool> onSelected;
  final QuestionModel question;
  const QuizWidgwt({Key? key, required this.question,
  required this.onSelected
  }): super(key: key);

  @override
  _QuizWidgwtState createState() => _QuizWidgwtState();
  
}

class _QuizWidgwtState extends State<QuizWidgwt> {
   int indexSelected =-1;
   AwserModel awnser(int index)=> widget.question.awsers[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child:Column(
        children: [
          SizedBox(height: 30,),
          Text(widget.question.title, style: AppTextStyles.heading,
          ),
          SizedBox(height: 24,),
          for(var i=0;i<widget.question.awsers.length;i++)
          AwserWidget(
          awnser: awnser(i),
          disabled: indexSelected !=-1, // serve para selecionar apenas uma opção
          isSelected: indexSelected==i,
          onTap:(value){
            indexSelected =i;
            setState(() {
              
            });
             Future.delayed(Duration(seconds: 2)).then((_) => widget.onSelected(value));
          },
          ),
        ],
      ) ,
    );
  }
}