import 'package:flutter/material.dart';
import 'package:sample_test/screens/settings/about_app.dart';
import 'package:sample_test/screens/settings/clear_all_data.dart';
import 'package:sample_test/screens/settings/exit_app.dart';
import 'package:sample_test/screens/settings/go_back.dart';
import 'package:sample_test/screens/settings/privacy_policy.dart';
import 'package:sample_test/screens/settings/terms_and_conditions.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Settings',
          style: TextStyle(
              color: Colors.green, fontSize: 30, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            ClearAllData(),
            PrivacyPolicy(),
            TermsAndConditions(),
            AboutApp(),
            ExitApp(),
            GoBackToHome(),
          ],
        ),
      ),
    );
  }
}
