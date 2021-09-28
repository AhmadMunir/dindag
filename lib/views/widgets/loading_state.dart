import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  const LoadingState({
    Key? key,
    required this.child,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return child;
        }

        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      future: Future(() async {
        await Future.delayed(duration ?? Duration(seconds: 2));
        return true;
      }),
    );
  }
}
