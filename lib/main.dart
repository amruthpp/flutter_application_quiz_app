import 'package:flutter/material.dart';

import 'package:flutter_application_quiz_app/view/spalsh_screen/spalsh_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
       

      
    );
  }
}