import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // خلفية بيضاء
        foregroundColor: Colors.black, // لون النص أسود
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),  
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
