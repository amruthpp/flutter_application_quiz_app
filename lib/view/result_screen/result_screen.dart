import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/utlis/color_constants.dart';
import 'package:flutter_application_quiz_app/view/category_screen/category_screen.dart';
import 'package:flutter_application_quiz_app/view/home_screen/home_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key,
      required this.rightAnsCount,
      required this.wrongAnsCount,
      required this.questions});

  final int rightAnsCount;
  final int wrongAnsCount;
  final List questions;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starCount = 0;
  @override
  void initState() {
    starCount = calPercentage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildStarViewSection(),
            _buildScoreViewSection(),
            _buildRestartButtonSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStarViewSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding:
              EdgeInsets.only(right: 9, left: 9, bottom: index == 1 ? 15 : 10),
          child: Icon(
            Icons.star_purple500_sharp,
            color: index < starCount ? Colors.amber : Colors.white38,
            size: index == 1 ? 90 : 60,
          ),
        ),
      ),
    );
  }

  Widget _buildScoreViewSection() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            _getString(),
            style: TextStyle(
              color: Colors.amber,
              fontSize: 32,
              fontWeight: FontWeight.w500,
              letterSpacing: -1,
            ),
          ),
        ),
        Text(
          "${widget.rightAnsCount} / ${widget.questions.length}",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 32,
            fontWeight: FontWeight.w500,
            letterSpacing: -1.7,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Correct Answers: ${widget.rightAnsCount}",
          style: TextStyle(
            fontSize: 15.3,
            fontWeight: FontWeight.w600,
            color: ColorConstants.fontWhite,
          ),
        ),
        Text(
          "Wrong Answers: ${widget.wrongAnsCount}",
          style: TextStyle(
            fontSize: 15.3,
            fontWeight: FontWeight.w600,
            color: ColorConstants.fontWhite,
          ),
        ),
      ],
    );
  }

  Widget _buildRestartButtonSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(13),
              onTap: () {
                widget.questions.shuffle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      questionList: widget.questions,
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConstants.fontWhite,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.replay,
                      color: ColorConstants.mainBlack,
                      size: 26,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Restart",
                      style: TextStyle(
                        color: ColorConstants.mainBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 25),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(13),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(),
                  ),
                );
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConstants.fontWhite,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: ColorConstants.mainBlack,
                      size: 26,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Menu",
                      style: TextStyle(
                        color: ColorConstants.mainBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getString() {
    double scorePercentage =
        (widget.rightAnsCount / widget.questions.length) * 100;
    if (scorePercentage >= 45) {
      if (scorePercentage >= 80) {
        return "Congratulations !";
      } else {
        return "Average !";
      }
    }
    return "Better luck next time !";
  }

  int calPercentage() {
    double percentage = (widget.rightAnsCount / widget.questions.length) * 100;
    if (percentage >= 80) {
      return 3;
    } else if (percentage >= 50) {
      return 2;
    } else if (percentage >= 30) {
      return 1;
    } else {
      return 0;
    }
  }
}