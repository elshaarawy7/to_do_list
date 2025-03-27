import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.validator, 
    this.controller , 
  });

  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
