import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevlButtonWidget extends StatelessWidget {
   final String label;
   LevlButtonWidget({Key? key, required this.label,}):
   assert(["Fácil","Medio","Dificil","Perito"].contains(label)),
   super(key: key);
final config ={
  "Fácil":{
    "color":AppColors.levelButtonFacil,
    "borderColor":AppColors.levelButtonBorderFacil,
    "fontColor":AppColors.levelButtonTextFacil,
  },
  "Medio":{
    "color":AppColors.levelButtonMedio,
    "borderColor":AppColors.levelButtonBorderMedio,
    "fontColor":AppColors.levelButtonTextMedio,
  },
  "Dificil":{
    "color":AppColors.levelButtonDificil,
    "borderColor":AppColors.levelButtonBorderDificil,
    "fontColor":AppColors.levelButtonTextDificil,
  },
  "Perito":{
    "color":AppColors.levelButtonPerito,
    "borderColor":AppColors.levelButtonBorderPerito,
    "fontColor":AppColors.levelButtonTextPerito,
  }
};

Color get color=>config[label]!['color']!;
Color get bordercolor=>config[label]!['borderColor']!;
Color get fontcolor=>config[label]!['fontColor']!;


  @override
  Widget build(BuildContext context) {
    return  Container(
         child: Container(
           decoration: BoxDecoration(
             color: color,
             borderRadius: BorderRadius.circular(28),
             border: Border.fromBorderSide(BorderSide(color:bordercolor))
           ),
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
             child: Text(
               label,
           
          style: GoogleFonts.notoSans(
              color:fontcolor,
              fontSize: 13,
              
            ),
            
            ),
            ),
          )
    );
  }
}