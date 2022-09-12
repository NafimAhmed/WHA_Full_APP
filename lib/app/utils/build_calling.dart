import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/calling_appointment.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/service/calling_appointment.service.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


import '../app_state.dart';

class BuildCalling extends StatefulWidget {
  BuildCalling({Key? key, required this.appointment, required this.updateCallingAppointment, required this.receiveCall, required this.endCall}) : super(key: key);
  final Function updateCallingAppointment;
  final Function receiveCall;
  final Function endCall;
  final CallingAppointment appointment;

  @override
  State<BuildCalling> createState() => _BuildCallingState();
}

class _BuildCallingState extends State<BuildCalling> {
  User user = Get.find<AppState>().user;

  final CallingAppointmentService service = CallingAppointmentService();

  @override
  Widget build(BuildContext context) {
    _playRingtone();
    Size size = MediaQuery.of(context).size;
    String doctorName = widget.appointment.doctorForAppointment.firstName + ' ' + widget.appointment.doctorForAppointment.lastName;
    if(doctorName == ' '){
      doctorName = 'Doctor';
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                Api.baseAPI +'/'+ widget.appointment.doctorForAppointment.image,
                fit: BoxFit.fill,
                height: 130,
                width: 130,
                errorBuilder: (BuildContext context, Object object,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/person.jpg',
                    height: 130,
                    width: 130,
                  );
                },
              ),
            ),
            Column(
              children: [
                Text(
                  doctorName + ' is calling...',
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green.shade900,
                        child: IconButton(
                          onPressed:()async{
                            _stopRingtone();
                            widget.receiveCall.call();
                            if(widget.appointment.meetLink.length > 20){
                              await _joinMeeting(room: widget.appointment.meetLink.substring(20).replaceAll(' ', '').replaceAll('.', ''));
                            }
                          },
                          icon: const Icon(
                            Icons.call,
                            size: 35,
                            color: backgroundColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red.shade900,
                        child: IconButton(
                          onPressed:()async{
                            _stopRingtone();
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            String accessToken = prefs.getString('access_token') ?? '';
                            service.endCall(accessToken: accessToken, appointmentId: widget.appointment.id);
                            Future.delayed(const Duration(seconds: 1), (){
                              widget.endCall.call();
                              widget.updateCallingAppointment.call();
                            });
                          },
                          icon: const Icon(
                            Icons.call_end,
                            size: 35,
                            color: backgroundColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ],
            ),
          ],
        ),
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
        ..userDisplayName = user.firstName + ' ' + user.lastName
        ..userEmail = user.email
        ..userAvatarURL = '${Api.baseAPI}/${user.image}'
        ..audioOnly = false
        ..audioMuted = false
        ..videoMuted = true
        ..featureFlags = {};

      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(
            onConferenceTerminated: (message) async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              String accessToken = prefs.getString('access_token') ?? '';
              service.completeCall(accessToken: accessToken, appointmentId: widget.appointment.id);
              widget.endCall.call();
              widget.updateCallingAppointment.call();
            }),
      );
    } catch (_) {
      log(_.toString());
    }
  }

  _playRingtone(){
    _vibrate();
    FlutterRingtonePlayer.play(
        android: AndroidSounds.ringtone,
        ios: IosSounds.glass,
        looping: true,
        volume: 3.0,
        asAlarm: true);
    Future.delayed(const Duration(minutes: 2), (){
      _stopRingtone();
    });
  }

  _stopRingtone(){
    FlutterRingtonePlayer.stop();
  }
  _vibrate()async{
    Vibrate.vibrate();
    if(mounted){
      await Future.delayed(const Duration(milliseconds: 1500), (){
        _vibrate();
      });
    }
  }
}
