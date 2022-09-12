import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_chat_module/p_chat_controller.dart';

class PChatPage extends GetView<PChatController> {
  const PChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'CHAT\nINBOX',
          style: TextStyle(
            color: Colors.black26,
            fontSize: 45,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
