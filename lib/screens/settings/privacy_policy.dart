import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
            Icons.privacy_tip,
            color: Colors.white54,
          ),
          title: Text(
            'Privacy Policy',
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
            "Privacy Policy",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 23),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Last Updated: 9.11.2023",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  "Hello, and thank you for choosing Personal Money Management application developed by Safwan CH! Your privacy is important to us, and we want you to understand how we handle your information.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //1
                Text(
                  "1. Information We Don't Collect:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "We want to be clear – we don't collect any personal information from you. Your privacy matters, and we respect that.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //2
                Text(
                  "2. User-Generated Data:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                //2.1
                Text(
                  "2.1 Transaction and Category Data:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Personal Money Management application allows you to add transactions and categories. This data is stored locally on your device and is not transmitted or stored by us.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //2.2
                Text(
                  "2.2 Viewing and Analyzing Data:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "You can view your added transactions and categories within the app. The app may also provide analysis through charts. All this data is processed locally on your device.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //2.3
                Text(
                  "2.3 Filtering Transactions:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "The app allows you to filter transaction data for a more customized view. Again, this functionality is performed locally on your device.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //3
                Text(
                  "3. User-Friendly Approach:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "We designed this Personal Money Management application to be user-friendly and efficient, focusing on providing a seamless experience without compromising your privacy.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //4
                Text(
                  "4. Contact Information:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "If you have any questions, concerns, or feedback, feel free to reach out to Safwan CH at safwan55550000@gmail.com.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //5
                Text(
                  "5. Changes to Privacy Policy:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "If any changes are made to this Privacy Policy, they will be updated within the app. Please review the policy periodically.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Text(
                  "Thank you for using Personal Money Management Application! We hope it helps you manage your finances without worrying about your privacy.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
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
