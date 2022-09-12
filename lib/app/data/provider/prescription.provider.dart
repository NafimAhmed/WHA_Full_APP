import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/complain_for_prescription.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/model/test_for_prescription.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PrescriptionProvider {
  final Uri _uri = Uri.parse(Api.prescriptionList);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json",
    "Authorization": "Bearer " + Get.find<AppState>().accessToken
  };

  Future<List<Prescription>> getPrescriptions() async {
    List<Prescription> prescriptions = [];
    http.Response _response;
    try {
      _response = await http.get(_uri, headers: _headers);
      log('prescriptions response: ${_response.statusCode}');
      Iterable iterable = jsonDecode(_response.body);
      for (Map<String, dynamic> data in iterable) {
        log('prescription response length: ${iterable.length.toString()}');
        int id = data['id'] ?? 0;
        int patientId = data['patient_id'] ?? 0;
        int doctorId = data['doctor_id'] ?? 0;
        int pharmacyId = data['pharmacy_id'] ?? 0;
        String nextFollowUpQuantity = data['next_followup'] ?? '';
        String nextFollowUpUnit = data['followup_duration'] ?? '';
        String advice = data['advice'] ?? '';
        String strCreatedAt = data['created_at'] ?? '';
        String strUpdatedAt = data['updated_at'] ?? '';
        DateTime createdAt = DateTime.now();
        DateTime updatedAt = DateTime.now();
        try {
          createdAt = DateFormat('yyyy-MM-ddThh:mm:ss').parse(strCreatedAt);
          updatedAt = DateFormat('yyyy-MM-ddThh:mm:ss').parse(strUpdatedAt);
        } catch (_) {
          log('datetime conversion error: ${_.toString()}');
        }

        Prescription prescription = Prescription(
            id: id,
            patientId: patientId,
            doctorId: doctorId,
            pharmacyId: pharmacyId,
            nextFollowUpQuantity: nextFollowUpQuantity,
            nextFollowUpUnit: nextFollowUpUnit,
            advice: advice,
            doctor: getDoctorDetails(data),
            patient: getPatientDetails(data),
            medicines: getMedicineList(data),
            tests: getTestList(data),
            complains: getComplainList(data),
            createdAt: createdAt,
            updatedAt: updatedAt);
        prescriptions.add(prescription);
      }
    } catch (_) {
      log(_.toString());
    }
    return Future.value(prescriptions);
  }

  DoctorForPrescription getDoctorDetails(Map<String, dynamic> data) {
    Map<String, dynamic> doctorData = data['doctor'] ?? {};
    int detailsDoctorId = doctorData['id'] ?? 0;
    String doctorFirstName = doctorData['first_name'] ?? '';
    String doctorLastName = doctorData['last_name'] ?? '';
    String doctorImage = doctorData['image'] ?? '';
    String doctorPhone = doctorData['phone'] ?? '';
    List<Specialist> doctorSpecialists = [];
    // doctor specialization
    Iterable iterableDoctorSpecialization = data['specialist'] ?? [];
    for (Map<String, dynamic> doctorSpecializationData
        in iterableDoctorSpecialization) {
      int doctorSpecializationId = doctorSpecializationData['id'] ?? 0;
      String doctorSpecializationName = doctorSpecializationData['name'] ?? '';
      Specialist specialist = Specialist(
          id: doctorSpecializationId, name: doctorSpecializationName);
      doctorSpecialists.add(specialist);
    }
    DoctorForPrescription doctorForPrescription = DoctorForPrescription(
        id: detailsDoctorId,
        firstName: doctorFirstName,
        lastName: doctorLastName,
        image: doctorImage,
        phone: doctorPhone,
        specialists: doctorSpecialists);
    return doctorForPrescription;
  }

  PatientForPrescription getPatientDetails(Map<String, dynamic> data) {
    Map<String, dynamic> patientData = data['patient'] ?? {};
    int patientDetailsId = patientData['id'] ?? 0;
    String patientFirstName = patientData['first_name'] ?? '';
    String patientLastName = patientData['last_name'] ?? '';
    double patientUniqueId = patientData['unique_id'] ?? 0;
    String patientPhone = patientData['phone'] ?? '';
    String patientAddress = patientData['address'] ?? '';
    String gender = patientData['gender'] ?? '';
    String strDateOfBirth = patientData['date_of_birth'] ?? '';
    PatientForPrescription patientForPrescription = PatientForPrescription(
        id: patientDetailsId,
        uniqueId: patientUniqueId,
        firstName: patientFirstName,
        lastName: patientLastName,
        phone: patientPhone,
        address: patientAddress,
        gender: gender,
        dateOfBirth: strDateOfBirth);
    return patientForPrescription;
  }

  List<TestForPrescription> getTestList(Map<String, dynamic> data) {
    List<TestForPrescription> tests = [];
    Iterable iterableTestData = data['test'] ?? [];
    for (Map<String, dynamic> data in iterableTestData) {
      int id = data['id'] ?? 0;
      String name = data['name'] ?? '';
      TestForPrescription testForPrescription =
          TestForPrescription(id: id, name: name);
      tests.add(testForPrescription);
    }
    return tests;
  }

  List<ComplainForPrescription> getComplainList(Map<String, dynamic> data) {
    List<ComplainForPrescription> complains = [];
    Iterable iterableComplainData = data['complain'] ?? [];
    for (Map<String, dynamic> data in iterableComplainData) {
      int id = data['id'] ?? 0;
      String name = data['name'] ?? '';
      ComplainForPrescription complainForPrescription =
          ComplainForPrescription(id: id, name: name);
      complains.add(complainForPrescription);
    }
    return complains;
  }

  List<MedicineForPrescription> getMedicineList(Map<String, dynamic> data) {
    int id = data['id'] ?? 0;
    List<MedicineForPrescription> medicineForPrescriptions = [];
    Iterable iterableMedicineData = data['prescriptionAndMedicine'] ?? [];
    for (Map<String, dynamic> medicineData in iterableMedicineData) {
      int medicineForPrescriptionId = medicineData['id'] ?? 0;
      int medicineId = medicineData['medicine_id'] ?? 0;
      String medicineName = medicineData['name'] ?? '';
      String medicineGeneric = medicineData['generic'] ?? '';
      String medicineCompany = medicineData['company'] ?? '';
      String medicineStrength = medicineData['strength'] ?? '';
      String medicineDosage = medicineData['dosage'] ?? '';

      String medicineDurationQuantity = medicineData['duration'] ?? '';
      String medicineDurationUnit = medicineData['medicine_duration'] ?? '';
      String medicineTakeTime = medicineData['medicine_take_time_name'] ?? '';
      String medicineText = medicineData['medicine_text'] ?? '';
      int breakfast = medicineData['breakfast'] ?? 0;
      int lunch = medicineData['lunch'] ?? 0;
      int dinner = medicineData['dinner'] ?? 0;

      Medicine medicine = Medicine(
          id: medicineId,
          name: medicineName,
          generic: medicineGeneric,
          company: medicineCompany,
          strength: medicineStrength,
          dosage: medicineDosage,
          medicineText: medicineText);
      MedicineForPrescription medicineForPrescription = MedicineForPrescription(
          id: medicineForPrescriptionId,
          prescriptionId: id,
          medicineId: medicineId,
          durationQuantity: medicineDurationQuantity,
          durationUnit: medicineDurationUnit,
          medicineTakeTime: medicineTakeTime,
          breakfast: breakfast,
          lunch: lunch,
          dinner: dinner,
          medicine: medicine);
      medicineForPrescriptions.add(medicineForPrescription);
    }
    return medicineForPrescriptions;
  }
}
