import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
            Icons.help,
            color: Colors.white54,
          ),
          title: Text(
            'Terms And Conditions',
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
            "Terms and Conditions",
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
                  "Welcome to 'Personal Money Management Application' developed by Safwan CH! By using this app, you agree to the following terms and conditions:",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //1
                Text(
                  "1. Use of the App:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                //1.1
                Text(
                  "1.1 License:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "'Personal Money Management Application' grants you a non-exclusive, non-transferable, revocable license to use the app for personal use.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //1.2
                Text(
                  "1.2 Restrictions:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "You agree not to reproduce, distribute, modify, or create derivative works from the app.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //2
                Text(
                  "2. User Responsibilities:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                //2.1
                Text(
                  "2.1 Accurate Information:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "You are responsible for the accuracy of the data you input, including transactions and categories.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //2.2
                Text(
                  "2.2 Data Security:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Safeguard your device to prevent unauthorized access to your financial information stored within the app.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //3
                Text(
                  "3. Privacy:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                //3.1
                Text(
                  "3.1 No Personal Information Collection:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "'Personal Money Management Application' does not collect personal information. Refer to the Privacy Policy for more details.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //4
                Text(
                  "4. Updates and Changes:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                //4.1
                Text(
                  "4.1 App Updates:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Regularly check for app updates to access new features and improvements.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //4.2
                Text(
                  "4.2 Terms Updates:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "We may update these terms. Continued use of the app after updates constitutes acceptance of the new terms.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //5
                Text(
                  "5. Limitation of Liability:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                //5.1
                Text(
                  "5.1 No Guarantees:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "'Personal Money Management Application' is provided as is without any guarantees. We are not liable for any financial losses or damages incurred.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),

                //6
                Text(
                  "6. Termination:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                //6.1
                Text(
                  "6.1 Termination by You:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "You can uninstall the app at any time.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                //6.2
                Text(
                  "6.2 Termination by 'Personal Money Managment Application' :",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "'Personal Money Managment Application' reserves the right to terminate access if terms are violated.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
                const SizedBox(height: 10),

                //7
                Text(
                  "7. Contact Us:",
                  style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  "If you have questions or concerns, contact Safwan CH at safwan55550000@gmail.com.",
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),

                const SizedBox(height: 20),
                Text(
                  "By using 'Personal Money Managment Application', you agree to these terms and conditions. If you do not agree, please uninstall the app.",
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
