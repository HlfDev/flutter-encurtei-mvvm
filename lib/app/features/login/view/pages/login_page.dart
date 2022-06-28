import 'package:encurtei_ly/app/features/login/google_sign_in.dart';
import 'package:encurtei_ly/app/features/login/view_model/login_view_model.dart';
import 'package:encurtei_ly/app/shared/utils/utils.dart';
import 'package:encurtei_ly/app/shared/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel _controller;
  @override
  void initState() {
    super.initState();
    _controller = Provider.of<LoginViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateGradient(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: 300,
            child: SvgPicture.asset(AppAssets.vectors.svgLogin),
          ),
          const SizedBox(height: 32),
          const AppText.light(
            text: 'Entre com sua conta para manter seus dados salvos',
            fontSize: cFontSize24,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: cSize24),
            child: AppRoundedButton.white(
              text: 'Entrar com o Google',
              onTap: () => _controller.loginAndOpenHomePage(context),
              textColor: AppColors.darkGrey,
              hasIcon: true,
            ),
          ),
        ],
      ),
    );
  }
}
