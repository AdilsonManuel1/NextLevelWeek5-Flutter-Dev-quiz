//import 'package:devquiz/challenge/widgets/question_indicator/quiz/quiz_widget.dart';


import 'package:devquiz/challenge/challenge_page_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/Quiz_card/quiz_card_widget.dart';
//import 'package:devquiz/home/widgets/Quiz_card/quiz_card_widget.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/home_controller.dart';
//import 'package:devquiz/shared/widget/progress_indicatior/models/user_model.dart';
import 'package:flutter/material.dart';

import 'widgets/level_button/level_button_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    controller.getUser();
    controller.getQuizzes();
    super.initState();
    controller.stateNotifier.addListener(() {
       setState(() {
         
       });
    });
  }
 
 final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucesso) {
        
   
    return Scaffold(
      
      appBar: AppBarWidget(user: controller.user!,),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevlButtonWidget(
              label:'Fácil',
              
            ) ,
            LevlButtonWidget(
              label:'Medio',
              
            ) ,
             LevlButtonWidget(
              label:'Dificil',
              
            ) ,
             LevlButtonWidget(
              label:'Perito',
              
            ) ,
              ],
            ),
          ),
          SizedBox(height: 5,),
          Expanded(child: 
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 4,
            children: controller.quizzes!.map((e) => QuizCardWidget(
              title: e.title,
              percent: (e.questionAnswered/e.questions.length),    
              completed:  "${e.questionAnswered}/${e.questions.length}",
             onTap: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (context)=>ChallengePage(
                  questions:e.questions,
                  title: e.title,
                ),
                
                ),
                );
             },
            )).toList()
          )
          ),
          

        
        ],
      )
    );
   }else{
     return Scaffold(
       body: Center(
       child: CircularProgressIndicator(
         valueColor: AlwaysStoppedAnimation<Color>
         (AppColors.darkGreen),
       ),
     
     ),
     );
     
   }
  }
}