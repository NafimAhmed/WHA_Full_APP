import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_home_module/o_home_controller.dart';

class OHomePage extends GetView<OHomeController> {
  const OHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OHome Page')),
      body: Container(),
    );
  }
}
