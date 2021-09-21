import 'package:dindag/screen/auth/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  final String id = "RegisterPage";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  "assets/img/onboarding/onBoarding2.svg",
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: "Poppins",
                                color: Colors.indigo[900],
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email ID",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.alternate_email_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                isCollapsed: true,
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 20,
                                ),
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
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Name",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Whatsapp",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.messenger_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Address",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.home,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Card ID",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.credit_card_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Image",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.photo_size_select_actual_rounded,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Role",
                                focusColor: Colors.grey,
                                fillColor: Colors.indigo,
                                prefixIcon: Icon(
                                  Icons.admin_panel_settings_rounded,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
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
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text("Login"),
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
