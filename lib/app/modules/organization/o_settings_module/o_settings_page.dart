import 'package:wha/app/modules/organization/o_settings_module/o_settings_controller.dart';
import 'package:wha/app/modules/patient/p_settings_module/widgets/p_settings_theme.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OSettingsPage extends GetView<OSettingsController> {
  const OSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                // icon
                Padding(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    'Settings',
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SwitchListTile(
                  title: const Text(
                    'Health Tips for you',
                  ),
                  subtitle: const Text(
                      'get information tips for your healthy lifestyle'),
                  isThreeLine: false,
                  dense: true,
                  onChanged: (bool value) {},
                  activeColor: primaryColor,
                  value: true,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.P_SETTINGS_NOTIFICATIONS);
                  },
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'Notification Settings',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: primaryColor,
                    size: 25,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'General',
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.P_SETTINGS_LANGUAGE);
                  },
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'Language',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: primaryColor,
                    size: 25,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'About Wha',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'Privacy Policy',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'Help & Support',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'Rate Wha app',
                  ),
                ),
                const PSettingsTheme(),
                ListTile(
                  onTap: () {},
                  dense: true,
                  enabled: true,
                  title: const Text(
                    'Accounts',
                  ),
                ),
                ListTile(
                  onTap: () => controller.logoutDialogVisible = true,
                  dense: true,
                  enabled: true,
                  title: Text(
                    'Logout',
                    style: GoogleFonts.openSans(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => controller.logoutDialogVisible = true,
                    icon: const Icon(
                      Icons.logout,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              return Positioned(
                child: Center(
                  child: controller.logoutDialogVisible == true
                      ? AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Image(
                                image: AssetImage(
                                  'assets/icon.png',
                                ),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Wha',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          content:
                              const Text('Are you sure you want to Logout?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                controller.logout();
                              },
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                controller.logoutDialogVisible = false;
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
