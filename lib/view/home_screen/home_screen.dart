import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/utlis/color_constants.dart';
import 'package:flutter_application_quiz_app/view/home_screen/widget/options_card.dart';
import 'package:flutter_application_quiz_app/view/result_screen/result_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.questionList});

  final List questionList;

  @override
  State<HomeScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<HomeScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int rightAnswerCount = 0;
  int wrongAnswerCount = 0;
  double value = 0;

  @override
  void initState() {
    widget.questionList.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      appBar: _buildAppBarSection(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            _buildQuestionSection(),
            SizedBox(height: 10),
            _buildOptionSelectionSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildNextButtonSection(context),
    );
  }

  AppBar _buildAppBarSection() {
    return AppBar(
      backgroundColor: ColorConstants.mainBlack,
      surfaceTintColor: ColorConstants.mainBlack,
      leadingWidth: 60,
      toolbarHeight: 80,
      titleSpacing: 10,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          color: ColorConstants.fontWhite,
        ),
      ),
      centerTitle: true,
      title: Row(
        children: <Widget>[
          SizedBox(
            width: 270,
            child: LinearProgressIndicator(
              minHeight: 15,
              backgroundColor: ColorConstants.containerGrey,
              value: (questionIndex + 1) / widget.questionList.length,
              color: ColorConstants.blue,
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Text(
          "${questionIndex + 1}/${widget.questionList.length}",
          style: TextStyle(
            color: ColorConstants.blue,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 15),
      ],
    );
  }

  Widget _buildOptionSelectionSection() {
    return Column(
      children: List.generate(
        4,
        (index) => OptionsCard(
          borderColor: _getColor(index),
          option: widget.questionList[questionIndex]["options"][index],
          selectedIcon: _getOptionIcon(index),
          onOptionTap: () {
            if (selectedAnswerIndex == null) {
              setState(() {
                selectedAnswerIndex = index;
                if (selectedAnswerIndex ==
                    widget.questionList[questionIndex]["answer"]) {
                  rightAnswerCount++;
                } else {
                  wrongAnswerCount++;
                }
              });
            }
          },
        ),
      ),
    );
  }

  Widget? _buildNextButtonSection(BuildContext context) {
    return selectedAnswerIndex == null
        ? null
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(13),
              onTap: () {
                setState(() {
                  selectedAnswerIndex = null;
                  if (questionIndex < widget.questionList.length - 1) {
                    questionIndex++;
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          rightAnsCount: rightAnswerCount,
                          wrongAnsCount: wrongAnswerCount,
                          questions: widget.questionList,
                        ),
                      ),
                    );
                  }
                });
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConstants.blue,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: ColorConstants.fontWhite,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildQuestionSection() {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorConstants.containerGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            widget.questionList[questionIndex]["question"],
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: ColorConstants.fontWhite,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        selectedAnswerIndex == widget.questionList[questionIndex]["answer"]
            ? LottieBuilder.asset("assets/animations/popper.json",
                width: double.infinity, height: 300)
            : SizedBox(),
      ],
    );
  }

  IconData _getOptionIcon(int index) {
    if (selectedAnswerIndex != null) {
      if (selectedAnswerIndex == index) {
        if (selectedAnswerIndex ==
            widget.questionList[questionIndex]["answer"]) {
          return FontAwesomeIcons.circleCheck;
        } else {
          return FontAwesomeIcons.circleXmark;
        }
      }
      if (index == widget.questionList[questionIndex]["answer"]) {
        return FontAwesomeIcons.circleCheck;
      }
    }
    return FontAwesomeIcons.circle;
  }

  Color _getColor(int index) {
    if (selectedAnswerIndex != null) {
      if (selectedAnswerIndex == index) {
        if (selectedAnswerIndex ==
            widget.questionList[questionIndex]["answer"]) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      }
      if (index == widget.questionList[questionIndex]["answer"]) {
        return Colors.green;
      }
    }
    return Colors.grey.shade600;
  }
}