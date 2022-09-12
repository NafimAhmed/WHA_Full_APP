import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildDoctorShimmer extends StatelessWidget {
  const BuildDoctorShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 3, 3, 5),
      child: Card(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Colors.white60,
              child: const PhysicalModel(
                color: backgroundColor,
                child: SizedBox(
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.black26,
                    highlightColor: Colors.white60,
                    child: PhysicalModel(
                      color: backgroundColor,
                      child: SizedBox(
                        height: 15,
                        width: (size.width - 130),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Shimmer.fromColors(
                    baseColor: Colors.black26,
                    highlightColor: Colors.white60,
                    child: PhysicalModel(
                      color: backgroundColor,
                      child: SizedBox(
                        height: 15,
                        width: (size.width - 130) / 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Shimmer.fromColors(
                    baseColor: Colors.black26,
                    highlightColor: Colors.white60,
                    child: PhysicalModel(
                      color: backgroundColor,
                      child: SizedBox(
                        height: 15,
                        width: (size.width - 130) / 1.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
