import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoBackToHome extends StatelessWidget {
  const GoBackToHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(23)),
        margin: const EdgeInsets.all(13.0),
        child: ListTile(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white54,
          ),
          title: Text(
            'Back to home',
            style: GoogleFonts.poppins(color: Colors.white60),
          ),
        ),
      ),
    );
  }
}
