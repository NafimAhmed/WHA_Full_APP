import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'build_concern.dart';

class BuildConcernList extends StatelessWidget {
  const BuildConcernList({Key? key, required this.concerns}) : super(key: key);
  final List<Concern> concerns;

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
              children: concerns
                  .map<Widget>(
                    (e) => BuildConcern(concern: e),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
