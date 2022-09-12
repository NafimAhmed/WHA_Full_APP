import 'package:get/get.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTopBar extends StatelessWidget {
  const BuildTopBar({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: !isLoading ? () {
              Get.back();
            } : null,
            icon: const Icon(
              Icons.arrow_back,
              color: primaryColor,
              size: 20,
            ),
          ),
          Text(
            'Patient Details',
            style: GoogleFonts.openSans(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: primaryColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
