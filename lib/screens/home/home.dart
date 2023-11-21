import 'package:flutter/material.dart';
import 'package:sample_test/db/category/category_db.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/screens/category/category_list.dart';
import 'package:sample_test/screens/home/bottom%20nav/bottom_nav.dart';
import 'package:sample_test/screens/home/home_screen.dart';
import 'package:sample_test/screens/chart/chart_screen.dart';
import 'package:sample_test/screens/settings/settings.dart';
import 'package:sample_test/screens/transactions/add%20and%20edit/add_transaction.dart';
import 'package:sample_test/screens/transactions/list/transaction_list.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    const HomeScreen(),
    const PieChartForIncomeAndExpense(),
    const TransactionList(),
    const AddTransaction(),
    const CategoryList()
  ];
  @override
  Widget build(BuildContext context) {
    CategoryDB.instance.refreshUI();
    TransactionDB.instance.refreshUI();
    TransactionDB.instance.refrechUiForRecent();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
            const Text(
              'Money Manager',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppSettings()),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey.shade700,
                  size: 27,
                ))
          ],
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          }),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
