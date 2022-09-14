import 'package:get/get.dart';
import 'package:wha/app/routes/app_pages.dart';

class SignupSelectRoleController extends GetxController{
  patientSignup(){
    Get.toNamed(Routes.P_SIGN_UP);

  }
  doctorSignup(){
    Get.toNamed(Routes.D_SIGN_UP);
  }
  pharmacySignup(){
    Get.toNamed(Routes.F_SIGN_UP);
  }
  nurseSignup(){
    Get.toNamed(Routes.N_SIGN_UP);
  }
  organizationSignup(){
    Get.toNamed(Routes.O_SIGN_UP);
  }
}
