import 'dart:io';

import 'package:flutter/services.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:wha/wha.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';

void main() {
  /*runApp(MaterialApp(
      title: 'wha',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      home: const ConnectivityPipe()));*/
  runApp(Wha());
}

class ConnectivityPipe extends StatefulWidget {
  const ConnectivityPipe({Key? key}) : super(key: key);


  @override
  State<ConnectivityPipe> createState() => _ConnectivityPipeState();
}

class _ConnectivityPipeState extends State<ConnectivityPipe> {
  final SnackBar noInternetSnackBar = const SnackBar(
    duration: Duration(days: 365),
    content: Text('No Internet'),
  );
  final SnackBar internetReturnedSnackBar = const SnackBar(
    duration: Duration(seconds: 3),
    content: Text('Back Online'),
    backgroundColor: primaryColor,
  );

  bool isNoInternetSnackBarVisible = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarDividerColor: primaryColor,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder:
            (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            if (snapshot.data == ConnectivityResult.none) {
              ScaffoldMessenger.of(context).showSnackBar(noInternetSnackBar);
              setState(() {
                isNoInternetSnackBarVisible = true;
              });
            } else if (snapshot.data == ConnectivityResult.wifi ||
                snapshot.data == ConnectivityResult.mobile ||
                snapshot.data == ConnectivityResult.ethernet) {
              if (isNoInternetSnackBarVisible) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(internetReturnedSnackBar);
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    isNoInternetSnackBarVisible = false;
                  });
                });
              }
            }
          });
          return FutureBuilder(
            future: isNetworkAvailable(),
            builder: (context, result) {
              if (snapshot.data == ConnectivityResult.none) {
                return const NoInternet();
              } else if (result.hasData && result.data == false) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(noInternetSnackBar);
                  setState(() {
                    isNoInternetSnackBarVisible = true;
                  });
                });
                return const NoInternet();
              }
              return const Wha();
            },
          );
        },
      ),
    );
  }

  Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      }
    } catch (_) {
      return Future.value(false);
    }
    return Future.value(false);
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Internet'),
      ),
    );
  }
}
