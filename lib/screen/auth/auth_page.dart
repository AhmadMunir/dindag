import 'package:dindag/screen/auth/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  final String id = "AuthPage";

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/img/onboarding/onBoarding1.svg",
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
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
                          text: "New to Dindag? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "Register",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("register");
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
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
            ),
          ],
        ),
      ),
    );
  }
}
