import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/user_management/forgot_password_module/forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ForgotPassword Page')),
      body: Container(),
    );
  }
}
