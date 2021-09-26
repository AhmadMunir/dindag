import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrentTextFormField extends StatelessWidget {
  const CurrentTextFormField({Key? key, required this.focusNode, required this.labelText, required this.keyboardKey, required this.formKey, required this.nextNode}) : super(key: key);

  final FocusNode? focusNode;
  final String? labelText;
  final TextInputType? keyboardKey;
  final GlobalKey<FormState> formKey;
  final FocusNode? nextNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        focusNode: focusNode,
        keyboardType: keyboardKey,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          border: OutlineInputBorder(),
          labelText: labelText,
          errorStyle: TextStyle(
            color: Colors.red,
          ),
          isDense: true,
        ),
        // onChanged: (value) {
        //   formKey.currentState!.validate();
        // },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Field Can't be null";
          }
          return null;
        },
      ),
    );
  }
}
