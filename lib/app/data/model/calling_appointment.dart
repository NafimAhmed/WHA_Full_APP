import 'package:wha/app/data/model/appointment.dart';
import 'package:wha/app/data/model/doctor_for_appointment.dart';
import 'package:wha/app/data/model/patient_for_appointment.dart';

class CallingAppointment extends Appointment {
  int id = 0;
  int patientId = 0;
  int pharmacyId = 0;
  int doctorId = 0;
  int specialistId = 0;
  int slotId = 0;
  int requestedBy = 0;
  DateTime requestTime;
  DateTime appointmentDate;
  DateTime appointmentTime;
  String meetLink;
  DateTime meetLinkTime;
  DoctorForAppointment doctorForAppointment;
  PatientForAppointment patientForAppointment;

  CallingAppointment(
      {required this.id,
      required this.patientId,
      required this.pharmacyId,
      required this.doctorId,
      required this.specialistId,
      required this.slotId,
      required this.requestedBy,
      required this.requestTime,
      required this.appointmentDate,
      required this.appointmentTime,
      required this.meetLink,
      required this.meetLinkTime,
      required this.doctorForAppointment,
      required this.patientForAppointment})
      : super(
            id: id,
            patientId: patientId,
            pharmacyId: pharmacyId,
            doctorId: doctorId,
            specialistId: specialistId,
            slotId: slotId,
            requestBy: requestedBy,
            requestTime: requestTime,
            doctorForAppointment: doctorForAppointment,
            patientForAppointment: patientForAppointment);

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'patientId': patientId,
      'pharmacyId': pharmacyId,
      'doctorId': doctorId,
      'specialistId': specialistId,
      'slotId': slotId,
      'requestedBy': requestedBy,
      'requestTime': requestTime,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'meetLink': meetLink,
      'meetLinkTime': meetLinkTime,
      'doctorForAppointment': doctorForAppointment,
      'patientForAppointment': patientForAppointment
    };
    return map;
  }

  @override
  String toString() {
    return 'CallingAppointment{id: $id, patientId: $patientId, pharmacyId: $pharmacyId, doctorId: $doctorId, specialistId: $specialistId, slotId: $slotId, requestedBy: $requestedBy, requestTime: $requestTime, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, meetLink: $meetLink, meetLinkTime: $meetLinkTime, doctorForAppointment: $doctorForAppointment, patientForAppointment: $patientForAppointment}';
  }
}
