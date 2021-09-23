import 'package:dindag/bloc/blocs.dart';
import 'package:dindag/models/user.dart';
import 'package:dindag/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../main.dart';
import '../../../tools/config.dart';
import 'package:dindag/views/widgets/widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;

    // final _email = TextEditingController();
    // final _password = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              print(state.message!.isNotEmpty ? state.message! : '');
            }

            if (!(state.user is UnauthenticatedUser)) {
              Navigator.pop(context, state.user);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        'assets/logo-lmj-1.png',
                        height: MediaQuery.of(context).size.width / 2,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masuk",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.indigo[900],
                              ),
                            ),
                            CurrentTextField(
                              hint: 'Email ID',
                              controller: email,
                              icon: MdiIcons.at,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CurrentTextField(
                              hint: 'Password',
                              controller: password,
                              icon: MdiIcons.lock,
                              isFormPassword: true,
                              suffix: TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Forgot?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CurrentButton(
                              onTap: () async {
                                context.read<AuthBloc>().add(SignIn(
                                    email.text.trim(), password.text.trim()));
                                // BlocProvider<AuthBloc>.of(context).
                                // // Navigate.push(HomePage());
                              },
                              title: Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 30),
                              child: RichText(
                                text: TextSpan(
                                  text: "Belum punya akun? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Buat Akun",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigate.push(RegisterPage());
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CurrentButton extends StatelessWidget {
  const CurrentButton({
    Key? key,
    required this.onTap,
    this.color,
    required this.title,
  }) : super(key: key);

  final Function() onTap;
  final Color? color;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(
        top: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color ?? Colors.indigo[900],
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15),
            ),
          ),
          onPressed: onTap,
          child: title),
    );
  }
}
