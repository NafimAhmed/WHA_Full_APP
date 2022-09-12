

import 'dart:js';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_current_test_reports_module/p_current_test_reports_page.dart';
import 'package:wha/app/modules/patient/p_current_vital_signs_module/p_current_vital_signs_page.dart';
import 'package:wha/app/modules/patient/p_profile_module/p_Edit_Profile.dart';
import 'package:wha/app/modules/patient/p_profile_module/p_profile_controller.dart';
import 'package:wha/app/modules/patient/p_visit_history_module/p_visit_history_page.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PProfilePage extends GetView<PProfileController>{
  PProfilePage({Key? key}) : super(key: key);
  final AppState appState = Get.find<AppState>();

  @override
  Widget build(BuildContext context) {
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
              _buildProfileCard(appState.user as Patient,context),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      child: AppBar(
                        backgroundColor: backgroundColor,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(30.0),
                          child: TabBar(
                            labelColor: primaryColor,
                            labelStyle: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                            ),
                            onTap: (int index) {


                            },
                            enableFeedback: true,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: primaryColor,
                            indicatorWeight: 3,
                            physics: const BouncingScrollPhysics(),
                            isScrollable: true,
                            labelPadding:
                                const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            tabs: [
                              Tab(
                                child: Text(
                                  'Visit History',
                                  style: GoogleFonts.openSans(),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Tests Reports',
                                  style: GoogleFonts.openSans(),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Vital Signs',
                                  style: GoogleFonts.openSans(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 300.0,
                      child: const TabBarView(
                        children: [
                          PVisitHistoryPage(),
                          PCurrentTestReportsPage(),
                          PCurrentVitalSignsPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(User user,BuildContext context) {
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
                        errorBuilder: (context, error, stackTrace) {
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
                      onPressed: () {



                       // Navigator.push(context, route)


                         Navigator.push(context,
                            MaterialPageRoute(
                                 builder: (context) =>
                                    p_Edit_Profile()
                            )
                         );


                      },
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
