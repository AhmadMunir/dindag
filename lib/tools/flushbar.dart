import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';

void showFlushbar(BuildContext context, {String? message, String? title}) {
  Flushbar(
    duration: Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(10),
    borderRadius: BorderRadius.circular(8),
    title: title,
    message: message ??
        "Lorem ipsum is simply dummy text of the printing and typesetting industry",
  )..show(context);
}
