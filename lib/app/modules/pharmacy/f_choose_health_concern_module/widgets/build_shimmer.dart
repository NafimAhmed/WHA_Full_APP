import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
  const BuildShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 3, 3, 5),
      child: Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.white60,
        child: PhysicalModel(
          color: backgroundColor,
          child: Container(),
        ),
      ),
    );
  }
}
