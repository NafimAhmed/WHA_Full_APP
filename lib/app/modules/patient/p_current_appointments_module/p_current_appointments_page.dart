import 'package:wha/app/modules/patient/p_current_appointments_module/p_current_appointments_controller.dart';
import 'package:wha/app/modules/patient/p_current_appointments_module/widgets/build_current_appointment.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PCurrentAppointmentsPage extends GetView<PCurrentAppointmentsController> {
  const PCurrentAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateCurrentAppointments();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Next Appointments',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.P_ALL_APPOINTMENTS),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 0, 2),
                  child: Text(
                    'see all',
                    style: GoogleFonts.openSans(
                      color: primaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 224,
          child: Swiper(
            itemCount: controller.currentAppointments.length,
            itemHeight: 224,
            loop: false,
            autoplay: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index){
              return BuildCurrentAppointment(appointment: controller.currentAppointments[index]);
            },
          ),
        ),
      ],
    );
  }
}
