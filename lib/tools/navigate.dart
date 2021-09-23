import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

GlobalKey<NavigatorState> naviKey = GlobalKey<NavigatorState>();

class Navigate {
  static Future<void> push(Widget target, {String? routeName}) =>
      naviKey.currentState!.push(MaterialPageRoute(builder: (_) => target));

  static void pop() => naviKey.currentState!.pop();

  static Future<void> pushReplace(Widget target, {String? routeName}) => naviKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => target,));
}
