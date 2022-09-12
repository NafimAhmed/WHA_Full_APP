import 'dart:developer';

import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BuildAppointmentSlots extends StatelessWidget {
  const BuildAppointmentSlots(
      {Key? key,
      required this.doctorId,
      required this.concernId,
      required this.appointmentTime})
      : super(key: key);
  final int doctorId;
  final int concernId;
  final AppointmentTime appointmentTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SizedBox(
        height: size.height - 300,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 5)),
            SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
              children: appointmentTime.slots
                  .map<Widget>((e) => _buildSlotCard(e))
                  .toList(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotCard(AppointmentSlot slot) {
    return InkWell(
      onTap: () {
        log('slot selection confirmed: doctorId: $doctorId, concernId: $concernId, slotId: ${slot.id}');
        Get.toNamed(Routes.P_APPOINTMENT_VITAL_SIGN,
            arguments: doctorId,
            parameters: {'concernId': concernId.toString(), 'slotId': '${slot.id}'});
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            DateFormat('hh:mm a').format(slot.startTime),
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
