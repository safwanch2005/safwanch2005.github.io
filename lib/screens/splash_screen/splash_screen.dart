import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sample_test/screens/home/balance/balance_calculate.dart';
import 'package:sample_test/screens/home/balance/is_deleted.dart';
import 'package:sample_test/screens/home/home.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    BalanceCalculate.instance.netBalance = 0;
    BalanceCalculate.instance.getTotalBalance();
    goToHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('images/image.png')),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Personal\nMoney\nManagement',
            style: GoogleFonts.poppins(
                color: Colors.green, fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  goToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    IsDeleted.instance.isDeleted.value = 1 + IsDeleted.instance.isDeleted.value;
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }
}
