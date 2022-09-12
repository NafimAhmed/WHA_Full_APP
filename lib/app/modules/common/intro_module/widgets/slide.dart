import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  const Slide({Key? key, required this.text, required this.gif}) : super(key: key);
  final String text;
  final String gif;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double bottomSpace = size.height * 0.12;
    double topSpace = 105;
    double availableHeight = size.height - (bottomSpace + topSpace + 80);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        SizedBox(
          height: availableHeight * 0.3,
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 14
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: availableHeight * 0.7,
          child: Center(
            child: Image(
              image: AssetImage(
                'assets/$gif',
              ),
              width: size.width,
            ),
          ),
        ),
      ],
    );
  }
}