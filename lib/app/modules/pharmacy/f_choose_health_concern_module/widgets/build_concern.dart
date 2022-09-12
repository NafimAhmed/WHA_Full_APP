import 'dart:developer';

import 'package:wha/app/data/model/concern.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:wha/app/data/api.dart';
import 'package:get/get.dart';

class BuildConcern extends StatelessWidget {
  const BuildConcern({Key? key, required this.concern}) : super(key: key);
  final Concern concern;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        log('health concern confirmed: ${concern.id}');
        Get.toNamed(Routes.F_CHOOSE_A_DOCTOR, arguments: concern.id);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
        child: PhysicalModel(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(5),
          elevation: 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Image(
                  image: NetworkImage(
                    '${Api.baseAPI}/${concern.icon}',
                  ),
                  errorBuilder: (BuildContext context, Object obj, StackTrace? stackTrace){
                    return const Image(
                      image: AssetImage(
                        'assets/icon.png',
                      ),
                      height: 50,
                      width: 50,
                    );
                  },
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width/2) - 90,
                child: Text(
                  concern.concern,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
