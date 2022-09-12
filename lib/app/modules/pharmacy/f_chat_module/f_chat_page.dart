import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_chat_module/f_chat_controller.dart';

class FChatPage extends GetView<FChatController> {
  const FChatPage({Key? key}) : super(key: key);

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
