import 'package:flutter/material.dart';
import 'package:wha/app/modules/pharmacy/f_choose_health_concern_module/widgets/widgets.dart';

class BuildConcernsLoading extends StatelessWidget {
  const BuildConcernsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 130,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1.8,
              children: const [
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
                BuildShimmer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
