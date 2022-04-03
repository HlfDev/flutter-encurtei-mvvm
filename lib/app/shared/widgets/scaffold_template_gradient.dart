import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/shared/shared.dart';

class ScaffoldTemplateGradient extends StatelessWidget {
  final Widget body;

  const ScaffoldTemplateGradient({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.darkBlue,
            AppColors.lightBlue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(cPadding16),
            child: body,
          ),
        ),
      ),
    );
  }
}
