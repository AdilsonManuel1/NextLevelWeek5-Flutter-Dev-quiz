

import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indication_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/quiz/quiz_widget.dart';
import 'package:devquiz/home/widgets/next_button/next_button_widgte.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/widget/progress_indicatior/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  
  ChallengePage({Key? key, required this.questions, required this.title}): super(key:key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
 final controller = ChallengeController();
 final pageController = PageController();
  @override
   void initState(){
     pageController.addListener(() {
       // para variar o valor de acordo a pergunta e actualizar na pagina
       controller.currentPage =pageController.page!.toInt()+1;
     
     });
     super.initState();
   }
    void nextPage(){
      
      if(controller.currentPage<widget.questions.length) // Ajuda a validar se estamos na ultima pagina 
      pageController.nextPage(duration: Duration(milliseconds: 200), 
      curve: Curves.linear);
    }
  void onSelected(bool value){
    if(value){
      controller.qtdAnwserRight++;
    }
    nextPage();
}
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(86),
          child:
          SafeArea(
          top: true,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(icon: Icon(Icons.close),
               onPressed:(){
                 Navigator.pop(context);
               }),

               ValueListenableBuilder<int>(valueListenable: controller.currentPageNotifier, builder: (
                 context,value,_
               )=>
              QuestionIndication(
                
                currentPage:value,
                lenght: widget.questions.length,
              ),
               ),
            ],
          ), 
          
          ),
           
        ) ,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: 
            widget.questions.map((e) => QuizWidgwt(question: e,
            onSelected:onSelected,)
            ).toList(),
          
        ),
        bottomNavigationBar: 
        SafeArea(
          bottom: true,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<int>(
  valueListenable: controller.currentPageNotifier,
 builder: (context, value,_)=> 
 Row(
   mainAxisAlignment:MainAxisAlignment.spaceAround ,
   children: [
          if(value< widget.questions.length) // Aparece o botão pular se ainda ter mais perguntas
      Expanded(
                child: NextButtonWidget.white(
                label: 'Pular',
                onTap: nextPage,
                
                ),
               
                ),
                 if (value ==widget.questions.length)
        SizedBox(width: 7,),
          if (value ==widget.questions.length)
              Expanded(
              child:
              NextButtonWidget.green(label: 'Confirmar',onTap:(){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=> ResultPage(
                    result: controller.qtdAnwserRight,
                    title: widget.title,
                    lenght: widget.questions.length,
                  
                  ),
                )
                );
              },),
              ),
   ],
 ) // Valida se as respostas foram respondidas, retornar um container
 
 
 
 )
          ),
        
        ),
       
    );
  }
}