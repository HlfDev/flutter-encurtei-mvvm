import 'package:flutter/material.dart';

import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';

class ScaffoldTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottom;
  final List<Widget>? appBarActions;

  final Color backgroundColor;

  const ScaffoldTemplate({
    Key? key,
    required this.title,
    required this.body,
    this.bottom,
    this.backgroundColor = AppColors.white,
    this.appBarActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: appBarActions,
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
      fontSize: cFontSize32,
      color: AppColors.black,
    );
  }
}
