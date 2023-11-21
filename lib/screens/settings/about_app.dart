import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAboutAppDialog(context),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(23)),
        margin: const EdgeInsets.all(13.0),
        child: ListTile(
          leading: const Icon(
            Icons.info,
            color: Colors.white54,
          ),
          title: Text(
            'About app',
            style: GoogleFonts.poppins(color: Colors.white60),
          ),
        ),
      ),
    );
  }

  void showAboutAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Personal Management Application",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 23),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Version: 1.0.0",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
              const SizedBox(height: 10),
              Text(
                "This money management app is designed to help you track and manage your finances efficiently.",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
              const SizedBox(height: 10),
              Text(
                "Features: \n- Expense tracking \n- Income management \n- Transaction categories \n- chart analysis",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
              const SizedBox(height: 10),
              Text(
                "Developer: Safwan CH",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
              const SizedBox(height: 10),
              Text(
                "Contact: safwan55550000.com",
                style: GoogleFonts.poppins(color: Colors.white70),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
