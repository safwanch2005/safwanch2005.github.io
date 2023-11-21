import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/screens/home/balance/balance_calculate.dart';
import 'package:sample_test/screens/home/balance/is_deleted.dart';

class HomeNetBal extends StatefulWidget {
  const HomeNetBal({super.key});

  @override
  State<HomeNetBal> createState() => _HomeNetBalState();
}

class _HomeNetBalState extends State<HomeNetBal> {
  @override
  void initState() {
    callSetState();
    super.initState();
  }

  callSetState() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: IsDeleted.instance.isDeleted,
      builder: (BuildContext context, int i, Widget? _) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      (BalanceCalculate.instance.netBalance ?? 0.0)
                          .toStringAsFixed(1),
                      style: GoogleFonts.poppins(
                          fontSize: 40,
                          color: BalanceCalculate.instance.netBalance! > 0
                              ? Colors.grey
                              : Colors.red),
                    ),
                    Text(
                      'Net Balance',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            (BalanceCalculate.instance.totalIncome ?? 0.0)
                                .toStringAsFixed(1),
                            style: GoogleFonts.poppins(
                                fontSize: 30, color: Colors.grey),
                          ),
                          Text(
                            'Total Income',
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            (BalanceCalculate.instance.totalExpense ?? 0.0)
                                .toStringAsFixed(1),
                            style: GoogleFonts.poppins(
                                fontSize: 30, color: Colors.grey),
                          ),
                          Text(
                            'Total Expense',
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
