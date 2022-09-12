import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_profile_module/f_profile_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class FProfilePage extends GetView<FProfileController> {
  FProfilePage({Key? key}) : super(key: key);
  final AppState appState = Get.find<AppState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              PhysicalModel(
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Image(
                        height: 30,
                        image: AssetImage(
                          'assets/logo.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildProfileCard(appState.user as Pharmacy),
              const SizedBox(height: 70),
              SizedBox(
                height: size.height - 330,
                child: const Center(
                  child: Text(
                    'HISTORY\n& TESTS',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 33,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(User user) {
    String name = user.firstName + ' ' + user.lastName;
    if(name.length > 15){
      name = user.firstName;
      if(name.length > 16){
        name = name.substring(0, 15);
      }
    }
    return SizedBox(
      height: 110,
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.network(
                        user.image,
                        fit: BoxFit.fill,
                        height: 90,
                        width: 90,
                        errorBuilder: (context, error, stackTrace){
                          return const Image(
                            image: AssetImage('assets/person.jpg'),
                            fit: BoxFit.fill,
                            height: 80,
                            width: 80,
                          );
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.openSans(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        user.email == '' ? '' : user.email,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        user.phone,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                child: PhysicalModel(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: backgroundColor,
                      ),
                      tooltip: 'Edit',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
