// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? bgColor;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.bgColor,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: color,
                  ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            
          ),
        ),
      ),
    );
  }
}