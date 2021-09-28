import 'dart:io';

import 'package:dindag/bloc/blocs.dart';
import 'package:dindag/tools/config.dart' as config;
import 'package:dindag/models/models.dart' as model;
import 'package:dindag/views/widgets/current_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _whatsapp = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _nik = TextEditingController();

  File file = File('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            if (state.message != null) {
              String msg = state.message!;

              if (msg.contains('true')) {
                Navigator.pop(context, _email.text);
              }

              config.showFlushbar(context, message: msg.split('-').last);
            }
          }
        },
        child: SafeArea(
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
                                controller: _email,
                              ),
                              CurrentTextField(
                                hint: 'Password',
                                isFormPassword: true,
                                icon: MdiIcons.lock,
                                controller: _password,
                                suffix: Container(),
                              ),
                              CurrentTextField(
                                hint: 'Nama',
                                controller: _name,
                                icon: Icons.person,
                              ),
                              CurrentTextField(
                                hint: 'Nomor Telepon',
                                icon: MdiIcons.at,
                                controller: _phone,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  controller: _whatsapp,
                                ),
                              CurrentTextField(
                                hint: 'Address',
                                icon: MdiIcons.home,
                                controller: _address,
                              ),
                              CurrentTextField(
                                hint: 'NIK',
                                icon: MdiIcons.cardAccountDetails,
                                controller: _nik,
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
                                            image: FileImage(file))),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        File _file = await config.imagePicker();
                                        setState(() {
                                          file = _file;
                                        });
                                      },
                                      child: Text('Pilih Gambar'))
                                ],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CurrentButton(
                                  onTap: () {
                                    // print(file!.path);
                                    model.User user = model.User(
                                      addresses: _address.text,
                                      cardId: _nik.text,
                                      email: _email.text,
                                      name: _name.text,
                                      password: _password.text,
                                      phoneNumber: _phone.text,
                                      whatsapp: (phoneSameWithWhatsapp)
                                          ? _phone.text
                                          : _whatsapp.text,
                                    );
                                    BlocProvider.of<AuthBloc>(context)
                                      ..add(SignUp(user, file: {
                                        'image': file.path,
                                      }));
                                    // config.Navigate.push(HomePage());
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
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AuthPage(),
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
      ),
    );
  }
}
