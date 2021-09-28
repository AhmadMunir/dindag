
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final Widget child;
  const SplashPage({Key? key, required this.child}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(future: Future(() async {
        await Future.delayed(Duration(seconds: 3));
        return true;
      }), builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.child;
        }
        return Center(
          child: Image.asset(
            'assets/logo-lmj-1.png',
            height: MediaQuery.of(context).size.width / 2,
          ),
        );
      }),
    );
  }
}
