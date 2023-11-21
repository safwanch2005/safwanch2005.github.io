//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/models/category/category_model.dart';
import 'package:sample_test/models/transaction/transaction_model.dart';
import 'package:sample_test/screens/home/home.dart';
import 'package:sample_test/screens/home/balance/balance_calculate.dart';
import 'package:sample_test/screens/home/balance/is_deleted.dart';
import 'package:sample_test/screens/transactions/add%20and%20edit/is_editmode.dart';
import 'package:sample_test/screens/transactions/add%20and%20edit/parse_amount_tostring.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({super.key});

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Container(
      margin: const EdgeInsets.all(15),
      height: 365,
      decoration: BoxDecoration(
          color: const Color.fromARGB(44, 158, 158, 158),
          borderRadius: BorderRadius.circular(30)),
      child: ValueListenableBuilder(
          valueListenable: TransactionDB.instance.transactionrecentListListner,
          builder: (BuildContext context, List<TransactionModel> newList,
              Widget? _) {
            newList = List.from(newList.reversed);
            BalanceCalculate.instance.getTotalBalance();
            return newList.isEmpty
                ? Center(
                    child: Text(
                      'No Transaction data !!!',
                      style: GoogleFonts.poppins(
                        color: Colors.white38,
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: newList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final transaction = newList[index];
                      return Container(
                        margin: const EdgeInsets.all(5),
                        child: Slidable(
                          key: Key(transaction.id!),
                          startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    if (transaction.id == null) {
                                      return;
                                    }

                                    TransactionDB.instance
                                        .deleteTransaction(transaction.id!);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                Colors.grey.shade900,
                                            content: Text(
                                              '\' ${transaction.purpose} \' deleted',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey),
                                            )));
                                    makeDelay();
                                  },
                                  icon: Icons.delete,
                                  label: 'delete',
                                  backgroundColor: Colors.black,
                                  foregroundColor:
                                      const Color.fromARGB(255, 187, 22, 10),
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    //edit
                                    Home.selectedIndexNotifier.value = 3;
                                    setState(() {
                                      IsEditingMode.instance.isEditmode = true;
                                      IsEditingMode.instance.modelForEdit =
                                          transaction;
                                    });
                                  },
                                  icon: Icons.edit,
                                  label: 'edit',
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.grey,
                                ),
                              ]),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.black,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Text(
                                    ParseDateToString()
                                        .parseDate(transaction.date),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                title: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          transaction.type ==
                                                  CategoryType.income
                                              ? Icons.arrow_upward
                                              : Icons.arrow_downward,
                                          color: transaction.type ==
                                                  CategoryType.income
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: Text(
                                            transaction.purpose,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                                trailing: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'RS: ',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),
                                      TextSpan(
                                        text: transaction.amount.toString(),
                                        style: GoogleFonts.poppins(
                                          color: transaction.type ==
                                                  CategoryType.income
                                              ? Colors.green
                                              : Colors.red,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                    });
          }),
    );
  }

  makeDelay() async {
    await Future.delayed(const Duration(milliseconds: 500));
    BalanceCalculate.instance.getTotalBalance();
    IsDeleted.instance.isDeleted.value = 1 + IsDeleted.instance.isDeleted.value;
  }
}
