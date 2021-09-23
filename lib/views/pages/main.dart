export 'handling/empty_page.dart';
export 'company_page.dart';
export 'onboarding_page.dart';
export 'report_page.dart';
export 'auth/auth_page.dart';
export 'auth/register_page.dart';
export 'homepage.dart';

import 'package:dindag/services/auth_service.dart';
import 'package:dindag/views/pages/homepage.dart';

import 'package:dindag/views/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<bool>(
    //     future: SharedPreferencesManager().isFreshInstalled(),
    //     builder: (context, isFreshInstalledSnapshot) {
    //       if (isFreshInstalledSnapshot.hasData) {
    //         if (!isFreshInstalledSnapshot.data!) {
    //           return HomePage();
    //         } else {
    return FutureBuilder<bool>(
        future: AuthService(http.Client()).showOnBoarding(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return OnBoardingPage();
          }
        });
    //     }
    //   } else {
    //     return HomePage();
    //   }
    // },
    // );
  }
}
