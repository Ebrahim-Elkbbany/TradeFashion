import 'package:flutter/material.dart';
import 'package:trade_fashion/features/auth/presentation/views/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const ResetPasswordViewBody(),
    );
  }
}
