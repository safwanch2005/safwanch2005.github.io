import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitApp extends StatelessWidget {
  const ExitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAlertDialogBox(context),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(23)),
        margin: const EdgeInsets.all(13.0),
        child: ListTile(
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.white54,
          ),
          title: Text(
            'Exit app',
            style: GoogleFonts.poppins(color: Colors.white60),
          ),
        ),
      ),
    );
  }

  void showAlertDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Are you sure?",
            style: GoogleFonts.poppins(color: Colors.white60),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: GoogleFonts.poppins(color: Colors.white60),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                "exit",
                style: GoogleFonts.poppins(color: Colors.red),
              ),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        );
      },
    );
  }
}
