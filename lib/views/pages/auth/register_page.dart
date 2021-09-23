import 'dart:io';

import 'package:dindag/tools/config.dart';
import 'package:dindag/views/widgets/current_textfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final String id = "RegisterPage";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLogin = true;
  bool phoneSameWithWhatsapp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  "assets/logo-lmj-1.png",
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(40))),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daftar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.indigo[900],
                              ),
                            ),
                            SizedBox(height: 20),
                            CurrentTextField(
                              hint: 'Email ID',
                              icon: MdiIcons.at,
                            ),
                            CurrentTextField(
                              hint: 'Password',
                              isFormPassword: true,
                              icon: MdiIcons.lock,
                              suffix: Container(),
                            ),
                            CurrentTextField(
                              hint: 'Nama',
                              icon: Icons.person,
                            ),
                            CurrentTextField(
                              hint: 'Nomor Telepon',
                              icon: MdiIcons.at,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nomor Telepon sama dengan Whatsapp'),
                                SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  child: Icon(phoneSameWithWhatsapp
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank),
                                  onTap: () {
                                    setState(() {
                                      phoneSameWithWhatsapp =
                                          !phoneSameWithWhatsapp;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            if (!phoneSameWithWhatsapp)
                              CurrentTextField(
                                hint: 'Whatsapp',
                                icon: MdiIcons.at,
                              ),
                            CurrentTextField(
                              hint: 'Address',
                              icon: MdiIcons.home,
                            ),
                            CurrentTextField(
                              hint: 'NIK',
                              icon: MdiIcons.cardAccountDetails,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(.35),
                                      image: DecorationImage(
                                          image: FileImage(File('')))),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('Pilih Gambar'))
                              ],
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CurrentButton(
                                onTap: () {
                                  Navigate.push(HomePage());
                                },
                                title: Text(
                                  "Buat Akun",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 30),
                              child: RichText(
                                text: TextSpan(
                                  text: "Have Account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => AuthPage(),
                                            ),
                                          );
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
