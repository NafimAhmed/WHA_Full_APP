import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class PVisitedDoctorsController extends GetxController {
  final _isLoading = false.obs;
  final _visitedDoctors = [].obs;

  get isLoading => _isLoading.value;

  get visitedDoctors => _visitedDoctors.value;

  final AppState appState = Get.find<AppState>();
  final VisitedDoctorsProvider visitedDoctorsProvider =
      Get.find<VisitedDoctorsProvider>();

  set isLoading(value) => _isLoading.value = value;

  set visitedDoctors(value) => _visitedDoctors.value = value;

  updateVisitedDoctors() async {
    isLoading = true;
    // visitedDoctors = await visitedDoctorsProvider.getVisitedDoctors(accessToken: appState.accessToken);
    isLoading = false;
    visitedDoctors
      ..add(Doctor(
          id: 1,
          organizationId: 2,
          roleId: 3,
          firstName: 'firstName',
          lastName: 'lastName',
          phone: 'phone',
          email: 'email',
          address: 'address',
          profession: 'profession',
          country: 'country',
          city: 'city',
          district: 'district',
          postcode: 'postcode',
          gender: 'gender',
          image: 'image'))
      ..add(Doctor(
          id: 1,
          organizationId: 2,
          roleId: 3,
          firstName: 'firstName',
          lastName: 'lastName',
          phone: 'phone',
          email: 'email',
          address: 'address',
          profession: 'profession',
          country: 'country',
          city: 'city',
          district: 'district',
          postcode: 'postcode',
          gender: 'gender',
          image: 'image'))
      ..add(Doctor(
          id: 1,
          organizationId: 2,
          roleId: 3,
          firstName: 'firstName',
          lastName: 'lastName',
          phone: 'phone',
          email: 'email',
          address: 'address',
          profession: 'profession',
          country: 'country',
          city: 'city',
          district: 'district',
          postcode: 'postcode',
          gender: 'gender',
          image: 'image'))
      ..add(Doctor(
          id: 1,
          organizationId: 2,
          roleId: 3,
          firstName: 'firstName',
          lastName: 'lastName',
          phone: 'phone',
          email: 'email',
          address: 'address',
          profession: 'profession',
          country: 'country',
          city: 'city',
          district: 'district',
          postcode: 'postcode',
          gender: 'gender',
          image: 'image'))
      ..add(Doctor(
          id: 1,
          organizationId: 2,
          roleId: 3,
          firstName: 'firstName',
          lastName: 'lastName',
          phone: 'phone',
          email: 'email',
          address: 'address',
          profession: 'profession',
          country: 'country',
          city: 'city',
          district: 'district',
          postcode: 'postcode',
          gender: 'gender',
          image: 'image'))
      ..add(Doctor(
          id: 1,
          organizationId: 2,
          roleId: 3,
          firstName: 'firstName',
          lastName: 'lastName',
          phone: 'phone',
          email: 'email',
          address: 'address',
          profession: 'profession',
          country: 'country',
          city: 'city',
          district: 'district',
          postcode: 'postcode',
          gender: 'gender',
          image: 'image'))
      ..add(Doctor(
          id: 1,
          organizationId: 2,
          roleId: 3,
          firstName: 'firstName',
          lastName: 'lastName',
          phone: 'phone',
          email: 'email',
          address: 'address',
          profession: 'profession',
          country: 'country',
          city: 'city',
          district: 'district',
          postcode: 'postcode',
          gender: 'gender',
          image: 'image'));
  }
}
