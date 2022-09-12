import 'package:wha/app/data/model/complain_for_prescription.dart';
import 'package:wha/app/data/model/doctor_for_prescription.dart';
import 'package:wha/app/data/model/medicine_for_prescription.dart';
import 'package:wha/app/data/model/patient_for_prescription.dart';
import 'package:wha/app/data/model/test_for_prescription.dart';

class Prescription {
  int id;
  int patientId;
  int doctorId;
  int pharmacyId;
  String nextFollowUpQuantity;
  String nextFollowUpUnit;
  String advice;
  DoctorForPrescription doctor;
  PatientForPrescription patient;
  List<MedicineForPrescription> medicines = [];
  List<TestForPrescription> tests = [];
  List<ComplainForPrescription> complains = [];
  DateTime createdAt;
  DateTime updatedAt;

  Prescription({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.pharmacyId,
    required this.nextFollowUpQuantity,
    required this.nextFollowUpUnit,
    required this.advice,
    required this.doctor,
    required this.patient,
    required this.medicines,
    required this.tests,
    required this.complains,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'pharmacyId': pharmacyId,
      'nextFollowUpQuantity': nextFollowUpQuantity,
      'nextFollowUpUnit': nextFollowUpUnit,
      'advice': advice,
      'doctor': doctor,
      'patient': patient,
      'medicines': medicines,
      'tests': tests,
      'complains': complains,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
    return map;
  }

  @override
  String toString() {
    return 'Prescription{id: $id, patientId: $patientId, doctorId: $doctorId, pharmacyId: $pharmacyId, nextFollowUpQuantity: $nextFollowUpQuantity, nextFollowUpUnit: $nextFollowUpUnit, advice: $advice, doctor: $doctor, patient: $patient, medicines: $medicines, tests: $tests, complains: $complains, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
