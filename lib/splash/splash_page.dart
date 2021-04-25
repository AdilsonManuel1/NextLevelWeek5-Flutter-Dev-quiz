

import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     // codigo muito bom, apresenta l«algo durante um tempo, depois navega para outra pagina
    Future.delayed(Duration(seconds: 2)).then((_) =>
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context)=> HomePage()
    ),
    ),
    );

    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(AppImages.logo)
        ),
      ),
    );
  }
}