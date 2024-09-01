import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/utlis/color_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({
    super.key,
    required this.option,
    required this.borderColor,
    required this.selectedIcon,
    this.onOptionTap,
  });

  final String option;
  final Color borderColor;
  final IconData selectedIcon;
  final void Function()? onOptionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onOptionTap,
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Text(
                option,
                style: TextStyle(
                  color: ColorConstants.fontWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              FaIcon(
                selectedIcon,
                size: 21,
                color: borderColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}