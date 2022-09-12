import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/p_all_appointments_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/material.dart';

class BuildAppointmentJoinButton extends StatelessWidget {
  BuildAppointmentJoinButton({Key? key, required this.appointment})
      : super(key: key);
  final CallingAppointment appointment;
  Patient patient = Get.find<AppState>().user as Patient;
  final PAllAppointmentsController controller = Get.find<PAllAppointmentsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()async{
              await _joinMeeting(room: appointment.meetLink.substring(20).replaceAll(' ', '').replaceAll('.', ''));
              controller.updateLiveAppointments();
            },
            child: AvatarGlow(
              glowColor: Colors.purpleAccent,
              endRadius: 30,
              duration: const Duration(milliseconds: 600),
              showTwoGlows: true,
              child: PhysicalModel(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(50),
                child: const SizedBox(
                  height: 45,
                  width: 45,
                  child: Center(
                    child: Icon(
                      Icons.phone,
                      color: backgroundColor,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'Join',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
  _joinMeeting({required String room}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

      var options = JitsiMeetingOptions(room: room)
        ..subject = 'Wha telemedicine'
        ..userDisplayName = patient.firstName + ' ' + patient.lastName
        ..userEmail = patient.email
        ..userAvatarURL = '${Api.baseAPI}/${patient.image}'
        ..audioOnly = false
        ..audioMuted = false
        ..videoMuted = true
        ..featureFlags = {};

      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(
            onConferenceTerminated: (message) {
              log('you can cancel the appointment here...');
            }),
      );
    } catch (_) {
      log(_.toString());
    }
  }
}
