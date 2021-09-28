export 'handling/empty_page.dart';
export 'company_page.dart';
export 'onboarding_page.dart';
export 'report_page.dart';
export 'auth/auth_page.dart';
export 'auth/register_page.dart';
export 'homepage.dart';

import 'package:dindag/bloc/blocs.dart';
import 'package:dindag/services/auth_service.dart';
import 'package:dindag/views/pages/homepage.dart';

import 'package:dindag/views/pages/onboarding_page.dart';
import 'package:dindag/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: AuthService(http.Client()).showOnBoarding(),
        builder: (context, snapshot) {
          return SplashPage(
              child: BlocProvider(
            create: (_) => AuthBloc()..add(CheckSession()),
            child: snapshot.hasData ? HomePage() : OnBoardingPage(),
          ));
        });
    //     }
    //   } else {
    //     return HomePage();
    //   }
    // },
    // );
  }
}
