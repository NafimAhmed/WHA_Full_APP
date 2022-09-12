import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_profile_module/o_profile_controller.dart';

class OProfilePage extends GetView<OProfileController> {
  const OProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OProfile Page')),
      body: Container(),
    );
  }
}
