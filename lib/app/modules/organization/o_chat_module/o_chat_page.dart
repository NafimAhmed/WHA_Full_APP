import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'o_chat_controller.dart';

class OChatPage extends GetView<OChatController> {
  const OChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OChat Page')),
      body: Container(
      ),
    );
  }
}
