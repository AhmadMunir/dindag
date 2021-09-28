export 'card.dart';
export 'current_textfield.dart';

import 'package:flutter/material.dart';

AppBar appBar({String? title, List<Widget>? actions}) {
    return AppBar(
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title ?? "-", style: TextStyle(color: Colors.black),),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
    );
  }