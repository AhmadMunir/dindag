import 'package:flutter/material.dart';

class CurrentTextField extends StatelessWidget {
  const CurrentTextField({
    Key? key,
    required this.hint,
    this.controller,
    this.icon,
    this.isFormPassword,
    this.suffix,
  }) : super(key: key);

  final String hint;
  final TextEditingController? controller;
  final IconData? icon;
  final bool? isFormPassword;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: (isFormPassword ?? false)
          ? TextFormField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: hint,
                focusColor: Colors.grey,
                fillColor: Colors.indigo,
                prefixIcon: Icon(
                  icon ?? Icons.lock,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            )
          : TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                focusColor: Colors.grey,
                fillColor: Colors.indigo,
                prefixIcon: Icon(
                  icon ?? Icons.alternate_email_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ),
    );
  }
}
