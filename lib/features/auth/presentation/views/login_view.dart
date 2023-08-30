import 'package:flutter/material.dart';
import 'package:trade_fashion/features/auth/presentation/views/widgets/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: LoginViewBody(),
    );
  }
}
