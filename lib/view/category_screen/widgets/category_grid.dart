import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/utlis/color_constants.dart';


class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.title,
    required this.questions,
    required this.image,
    this.onGridTap,
  });

  final String title;
  final List questions;
  final String image;
  final void Function()? onGridTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onGridTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorConstants.containerGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 44,
              backgroundImage: NetworkImage(image),
            ),
            Spacer(),
            Text(
              title,
              style: TextStyle(
                color: ColorConstants.fontWhite,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.3,
              ),
            ),
            Text(
              "${questions.length} Questions",
              style: TextStyle(
                color: ColorConstants.fontWhite,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}