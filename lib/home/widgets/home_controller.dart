//import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
//import 'package:devquiz/shared/widget/progress_indicatior/models/awser_model.dart';
//import 'package:devquiz/shared/widget/progress_indicatior/models/question_model.dart';
import 'package:devquiz/shared/widget/progress_indicatior/models/quiz_model.dart';
import 'package:devquiz/shared/widget/progress_indicatior/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class HomeController{
   final stateNotifier =ValueNotifier<HomeState>(HomeState.empyte);
   set state (HomeState state) => stateNotifier.value =state;
   HomeState get state => stateNotifier.value;
  //HomeState state =HomeState.empyte;
  UserModel? user;
  List <QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async{
   // await Future.delayed(Duration(seconds: 2));
   state =HomeState.loading;
    user = await repository.getUser();
  state =HomeState.sucesso;
  }
void getQuizzes() async{

  //await Future.delayed(Duration(seconds: 2));
  state = HomeState.loading;
    //quizzes = await repository.getQuizzes();
    quizzes = await repository.getQuizzes();
    state = HomeState.sucesso;
  //state = HomeState.sucesso;
 
  }
}

