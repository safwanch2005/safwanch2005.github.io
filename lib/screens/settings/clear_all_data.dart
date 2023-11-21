import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/db/category/category_db.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/screens/home/home.dart';

class ClearAllData extends StatelessWidget {
  const ClearAllData({super.key});

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
          leading: Icon(
            Icons.delete,
            color: Colors.red.shade700,
          ),
          title: Text(
            'Clear all data',
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
            "Clear All Data",
            style: GoogleFonts.poppins(color: Colors.white70),
          ),
          content: Text(
            "Are you sure you want to clear all data?",
            style: GoogleFonts.poppins(color: Colors.white70),
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
                "Clear",
                style: GoogleFonts.poppins(color: Colors.red),
              ),
              onPressed: () async {
                await TransactionDB.instance.clearAllTransaction();
                await CategoryDB.instance.clearAllCategory();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                Home.selectedIndexNotifier.value = 2;
              },
            ),
          ],
        );
      },
    );
  }
}
