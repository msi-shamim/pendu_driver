import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final String textLabel;
  final Function validator;
  final String hintText;
  final TextEditingController controller;

  PasswordTextFormField({
    this.textLabel,
    this.validator,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: true,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: textLabel,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          //hintText: hintText,
          // hintStyle: hintTextStyle(),
        ));
  }
}
