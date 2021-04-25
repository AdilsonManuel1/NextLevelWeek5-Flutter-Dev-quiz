import 'package:devquiz/core/app_gradients.dart';

import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/home_controller.dart';
import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';
import 'package:devquiz/shared/widget/progress_indicatior/models/user_model.dart';
import 'package:flutter/material.dart';



class AppBarWidget extends PreferredSize {
   final controller = HomeController();
  final UserModel user;
  AppBarWidget({required this.user}) : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
     
   
        child: Stack(
        
          children: [
           
            Container(
                 decoration: BoxDecoration(
        gradient:AppGradients.linear,
        
      ),
                height: 161,
                
              padding: const EdgeInsets.symmetric(horizontal: 24),
              //  padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text.rich(
                      TextSpan(
                      text:"Olá, ",
                      style: AppTextStyles.title,
                      children: [
                        TextSpan(
                          text:user.name,
                          style:AppTextStyles.titleBold,
                        )
                      ]
                       ),
                     
                    ),

                    
                    Container(
                      width: 58,
                      height: 58,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(user.photoUrl),
                        ) 
                      )
                    ),
                  
                  ],
                  
                ),
              ),
            
                Align(
              alignment:Alignment( 0.0,1.0),
              child: ScoreCardWidget(percent: user.score/100,),
            ),
          ],
        ),
      
    ),
  );
}