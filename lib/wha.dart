import 'dart:developer';

import 'package:wha/app/data/model/calling_appointment.dart';
import 'package:wha/app/data/model/doctor_for_appointment.dart';
import 'package:wha/app/data/model/patient_for_appointment.dart';
import 'package:wha/app/data/service/calling_appointment.service.dart';
import 'package:wha/app/theme/app_theme.dart';
import 'package:wha/app/utils/build_calling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

class Wha extends StatefulWidget {
  const Wha({Key? key}) : super(key: key);

  @override
  State<Wha> createState() => _WhaState();
}

class _WhaState extends State<Wha> {
  bool isLoading = false;
  bool isInTheCall = false;
  final CallingAppointmentService service = CallingAppointmentService();
  CallingAppointment callingAppointment = CallingAppointment(
      id: 0,
      patientId: 0,
      pharmacyId: 0,
      doctorId: 0,
      specialistId: 0,
      slotId: 0,
      requestedBy: 0,
      requestTime: DateTime.now(),
      appointmentDate: DateTime.now(),
      appointmentTime: DateTime.now(),
      meetLink: '',
      meetLinkTime: DateTime.now(),
      doctorForAppointment: DoctorForAppointment(
          id: 0,
          firstName: '',
          lastName: '',
          degrees: '',
          vat: 0,
          fee: 0,
          image: '',
          hospitalName: ''),
      patientForAppointment:
          PatientForAppointment(id: 0, firstName: '', lastName: '', image: ''));

  updateCallingAppointment() {
    if (mounted) {
      setState(() {
        callingAppointment = CallingAppointment(
            id: 0,
            patientId: 0,
            pharmacyId: 0,
            doctorId: 0,
            specialistId: 0,
            slotId: 0,
            requestedBy: 0,
            requestTime: DateTime.now(),
            appointmentDate: DateTime.now(),
            appointmentTime: DateTime.now(),
            meetLink: '',
            meetLinkTime: DateTime.now(),
            doctorForAppointment: DoctorForAppointment(
                id: 0,
                firstName: '',
                lastName: '',
                degrees: '',
                vat: 0,
                fee: 0,
                image: '',
                hospitalName: ''),
            patientForAppointment: PatientForAppointment(
                id: 0, firstName: '', lastName: '', image: ''));
      });
    }
  }

  receiveCall() {
    if (mounted) {
      setState(() {
        isInTheCall = true;
      });
    }
  }

  endCall() {
    if (mounted) {
      setState(() {
        isInTheCall = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading && callingAppointment.id == 0) {
      checkMyCall();
    }

    if (callingAppointment.id != 0 && !isInTheCall) {
      return BuildCalling(
          appointment: callingAppointment,
          updateCallingAppointment: updateCallingAppointment,
          receiveCall: receiveCall,
          endCall: endCall);
    }
    return GetMaterialApp(
      title: 'Wha',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      checkerboardOffscreenLayers: false,
      getPages: AppPages.pages,
    );
  }

  checkMyCall() async {
    log('checking call .... ');
    if (!isLoading) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString('access_token') ?? '';
      if (accessToken != '' && callingAppointment.id == 0) {
        CallingAppointment? appointment =
            await service.getCallingAppointment(accessToken: accessToken);
        if (appointment != null) {
          setState(() {
            callingAppointment = appointment;
          });
        } else {
          await Future.delayed(const Duration(seconds: 10), () {});
        }
      } else {
        await Future.delayed(const Duration(seconds: 10), () {});
      }
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      await Future.delayed(const Duration(seconds: 10), () async {
        await checkMyCall();
      });
    }
  }
}
