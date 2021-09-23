import 'package:dindag/bloc/blocs.dart';
import 'package:dindag/tools/config.dart';
import 'package:dindag/views/pages/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ArticleBloc()..add(ArticleEvent())),
        BlocProvider(create: (_) => EventBloc()..add(EventEvent())),
        BlocProvider(create: (_) => AuthBloc()..add(CheckSession())),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: naviKey,
          theme: ThemeData(
              scaffoldBackgroundColor: bgColor,
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme()),
          home: MainView()),
    );
  }
}
