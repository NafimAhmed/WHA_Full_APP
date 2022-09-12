import 'package:wha/app/data/model/doctor_for_appointment.dart';
import 'package:wha/app/data/model/patient_for_appointment.dart';

abstract class Appointment {
  int id = 0;
  int patientId = 0;
  int pharmacyId = 0;
  int doctorId = 0;
  int specialistId = 0;
  int slotId = 0;
  int requestBy = 0;
  DateTime requestTime;
  DoctorForAppointment doctorForAppointment;
  PatientForAppointment patientForAppointment;

  Appointment(
      {required this.id,
      required this.patientId,
      required this.pharmacyId,
      required this.doctorId,
      required this.specialistId,
      required this.slotId,
      required this.requestBy,
      required this.requestTime,
      required this.doctorForAppointment,
      required this.patientForAppointment});

  Map<String, dynamic> toMap();
}
