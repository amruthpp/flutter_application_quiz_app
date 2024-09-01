import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/utlis/color_constants.dart';
import 'package:flutter_application_quiz_app/utlis/image_constants.dart';
import 'package:flutter_application_quiz_app/view/category_screen/category_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
    ).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: _buildSplashLogoSection(),
    );
  }

  Widget _buildSplashLogoSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ImageConstants.LOGO,
            height: 140,
            width: 140,
          ),
          Text(
            "Quiz App",
            style: TextStyle(
              color: ColorConstants.fontWhite,
              fontSize: 40,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
            ),
          ),
        ],
      ),
    );
  }
}