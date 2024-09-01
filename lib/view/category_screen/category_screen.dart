import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/dummydb.dart';
import 'package:flutter_application_quiz_app/utlis/color_constants.dart';
import 'package:flutter_application_quiz_app/utlis/image_constants.dart';
import 'package:flutter_application_quiz_app/view/category_screen/widgets/category_grid.dart';
import 'package:flutter_application_quiz_app/view/home_screen/home_screen.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      appBar: _buildAppBarSection(),
      body: _buildQuizCategorySection(),
    );
  }

  AppBar _buildAppBarSection() {
    return AppBar(
      toolbarHeight: 85,
      backgroundColor: ColorConstants.mainBlack,
      surfaceTintColor: ColorConstants.mainBlack,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hi, User",
            style: TextStyle(
              color: ColorConstants.fontWhite,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.4,
            ),
          ),
          Text(
            "Let's make this day productive",
            style: TextStyle(
              color: ColorConstants.fontWhite,
              fontSize: 15.2,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.13,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(ImageConstants.PROFILE_IMG),
        ),
        SizedBox(width: 17)
      ],
    );
  }

  Widget _buildQuizCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 15),
          child: Text(
            "Let's play",
            style: TextStyle(
              color: ColorConstants.fontWhite,
              fontSize: 21,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: Dummydb.quizList.length,
            itemBuilder: (context, index) => CategoryGrid(
              title: Dummydb.quizList[index]["name"],
              questions:  Dummydb.quizList[index]["list"],
              image:  Dummydb.quizList[index]["image"],
              onGridTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                        questionList: Dummydb.quizList[index]["list"]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}