import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_choose_time_slot_module/p_choose_time_slot_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BuildAppointmentTimes extends StatelessWidget {
  BuildAppointmentTimes(
      {Key? key,
      required this.appointmentTimes})
      : super(key: key);
  List<AppointmentTime> appointmentTimes;
  final PChooseTimeSlotController controller =
      Get.find<PChooseTimeSlotController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.grey,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: appointmentTimes
                  .map<Widget>((e) => _buildDateCard(e))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDateCard(AppointmentTime appointmentTime) {
    bool isToday = false;
    bool isTomorrow = false;
    if (appointmentTime.date.year == DateTime.now().year &&
        appointmentTime.date.month == DateTime.now().month &&
        appointmentTime.date.day == DateTime.now().day) {
      isToday = true;
    }
    if (appointmentTime.date.year == DateTime.now().year &&
        appointmentTime.date.month == DateTime.now().month &&
        appointmentTime.date.day == DateTime.now().day + 1) {
      isTomorrow = true;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: InkWell(
        onTap: () {
          controller.updateSelectedAppointmentTimeIndex((controller.appointmentTimes as List<AppointmentTime>).indexOf(appointmentTime));
        },
        child: PhysicalModel(
          color: controller.selectedAppointmentTimeIndex ==
                  (controller.appointmentTimes as List<AppointmentTime>)
                      .indexOf(appointmentTime)
              ? primaryColor
              : backgroundColor,
          borderRadius: BorderRadius.circular(10),
          elevation: 10.0,
          child: SizedBox(
            width: 120,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    isToday
                        ? 'Today'
                        : isTomorrow
                            ? 'Tomorrow'
                            : DateFormat('EEEE').format(appointmentTime.date),
                    style: TextStyle(
                      color: controller.selectedAppointmentTimeIndex ==
                              (controller.appointmentTimes
                                      as List<AppointmentTime>)
                                  .indexOf(appointmentTime)
                          ? backgroundColor
                          : primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    DateFormat('d MMMM').format(appointmentTime.date),
                    style: TextStyle(
                      color: controller.selectedAppointmentTimeIndex ==
                              (controller.appointmentTimes
                                      as List<AppointmentTime>)
                                  .indexOf(appointmentTime)
                          ? backgroundColor
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
