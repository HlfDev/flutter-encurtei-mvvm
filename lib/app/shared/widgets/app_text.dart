import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const AppText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const AppText.light({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w300,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const AppText.regular({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  const AppText.bold({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        textAlign: textAlign,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
