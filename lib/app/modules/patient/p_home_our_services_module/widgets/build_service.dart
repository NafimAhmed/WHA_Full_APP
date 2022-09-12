import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildService extends StatelessWidget {
  const BuildService({Key? key, required this.image, required this.title, required this.onTap}) : super(key: key);
  final String image;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap.call();
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: PhysicalModel(
          color: backgroundColor,
          elevation: 1.0,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  image,
                ),
                height: 50,
                width: 50,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
