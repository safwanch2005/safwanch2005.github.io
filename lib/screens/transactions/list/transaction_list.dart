// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/models/category/category_model.dart';
import 'package:sample_test/models/transaction/transaction_model.dart';
import 'package:sample_test/screens/home/home.dart';
import 'package:sample_test/screens/transactions/drop%20down%20for%20type/dropdown_to_filter.dart';
import 'package:sample_test/screens/transactions/filter%20by%20selected%20date.dart/select_date_for_filter.dart';
import 'package:sample_test/screens/transactions/drop%20down%20for%20type/filter_data.dart';
import 'package:sample_test/screens/transactions/add%20and%20edit/is_editmode.dart';
import 'package:sample_test/screens/transactions/add%20and%20edit/parse_amount_tostring.dart';

// ignore: must_be_immutable
class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<TransactionModel> _allData = [];
  List<TransactionModel> _foundData = [];
  bool? i;

  @override
  void initState() {
    super.initState();
    FilterListData.instance.dropDownSelectedValueListner.value = 0;
    _loadTransactions();
    i = true;
  }

  _loadTransactions() async {
    final transactions = await TransactionDB.instance.getTransaction();
    setState(() {
      _allData = transactions;
      _foundData = transactions;
    });
  }

  _runFilter(String enteredKeyword) {
    List<TransactionModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allData;
    } else {
      results = _allData
          .where((transaction) => transaction.purpose
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 260,
                height: 55,
                child: TextFormField(
                  //search transactions by purpose
                  onChanged: (value) => _runFilter(value),
                  style: const TextStyle(color: Colors.green),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Icon(Icons.search)),
                    prefixIconColor: const Color.fromARGB(255, 120, 120, 120),
                    hintText: 'search by purpose',
                    hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 139, 139, 139),
                        fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const DropDownToFilter(),
            ],
          ),
          ValueListenableBuilder(
              valueListenable:
                  FilterListData.instance.dropDownSelectedValueListner,
              builder:
                  (BuildContext ctx, int dropDownselectedValue, Widget? _) {
                return FilterListData
                            .instance.dropDownSelectedValueListner.value ==
                        0
                    ? const SelectDateForFilter()
                    : Container(
                        height: 0,
                      );
              }),
          ValueListenableBuilder(
            valueListenable:
                FilterListData.instance.dropDownSelectedValueListner,
            builder: (BuildContext ctx, int dropDownselectedValue, Widget? _) {
              TransactionDB.instance.refreshUI();
              return Container(
                margin: const EdgeInsets.all(15),
                // height: 600,
                height: FilterListData
                            .instance.dropDownSelectedValueListner.value ==
                        0
                    ? 580
                    : 620,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(44, 158, 158, 158),
                    borderRadius: BorderRadius.circular(30)),
                child: ValueListenableBuilder(
                    valueListenable:
                        TransactionDB.instance.transactionListListner,
                    builder: (BuildContext context,
                        List<TransactionModel> newList, Widget? _) {
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
                              itemCount: _foundData.length,
                              itemBuilder: (BuildContext context, int index) {
                                final transaction = _foundData[index];
                                if (i == true) {
                                  _allData = newList;
                                  _foundData = newList;
                                  i = false;
                                }
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
                                                  .deleteTransaction(
                                                      transaction.id!);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.grey.shade900,
                                                      content: Text(
                                                        '\' ${transaction.purpose} \' deleted',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .grey),
                                                      )));
                                            },
                                            icon: Icons.delete,
                                            label: 'delete',
                                            backgroundColor: Colors.black,
                                            foregroundColor:
                                                const Color.fromARGB(
                                                    255, 187, 22, 10),
                                          ),
                                          SlidableAction(
                                            onPressed: (context) {
                                              //edit
                                              Home.selectedIndexNotifier.value =
                                                  3;
                                              setState(() {
                                                IsEditingMode
                                                    .instance.isEditmode = true;
                                                IsEditingMode.instance
                                                    .modelForEdit = transaction;
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 23,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200),
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
                                                  text: transaction.amount
                                                      .toString(),
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
            },
          ),
        ],
      ),
    );
  }

  callSetState() {
    setState(() {});
  }
}
