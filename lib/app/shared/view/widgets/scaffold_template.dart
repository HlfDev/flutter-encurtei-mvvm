import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';

class ScaffoldTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottom;

  final Color backgroundColor;

  const ScaffoldTemplate({
    Key? key,
    required this.title,
    required this.body,
    this.bottom,
    this.backgroundColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: AppBarTitle(title: title),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: cPadding16),
          child: Column(children: <Widget>[Expanded(child: body)]),
        ),
      ),
      bottomSheet: SafeArea(child: bottom ?? Container()),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final String title;

  const AppBarTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppText.bold(
      text: title,
      fontSize: cFontSize24,
      color: AppColors.black,
    );
  }
}
