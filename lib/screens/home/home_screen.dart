import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/screens/home/home.dart';
import 'package:sample_test/screens/home/home%20transaction%20list/home_listview.dart';
import 'package:sample_test/screens/home/balance/home_net_balance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomeNetBal(),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('recent transactions',
                      style: GoogleFonts.poppins(
                          color: Colors.grey, fontSize: 16)),
                  const SizedBox(
                    width: 90,
                  ),
                  GestureDetector(
                    onTap: () => Home.selectedIndexNotifier.value = 2,
                    child: Text(
                      'view all',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const HomeListView(),
      ],
    );
  }
}
