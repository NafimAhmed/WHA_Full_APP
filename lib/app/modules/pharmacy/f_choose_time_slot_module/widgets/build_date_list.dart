import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildDateList extends StatelessWidget {
  const BuildDateList({Key? key, required this.dates}) : super(key: key);
  final List<String> dates;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.grey,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: dates.map<Widget>((e) => _buildDateCard(e)).toList(),
        ),
      ),
    );
  }

  Widget _buildDateCard(String date) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: PhysicalModel(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        elevation: 10.0,
        child: SizedBox(
          width: 120,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Today',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '31 October',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
