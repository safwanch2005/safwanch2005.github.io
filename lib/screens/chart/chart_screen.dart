import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/db/category/category_db.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/models/transaction/transaction_model.dart';
import 'package:sample_test/screens/home/balance/balance_calculate.dart';

// ignore: must_be_immutable
class PieChartForIncomeAndExpense extends StatefulWidget {
  const PieChartForIncomeAndExpense({super.key});

  @override
  State<PieChartForIncomeAndExpense> createState() =>
      _PieChartForIncomeAndExpenseState();
}

class _PieChartForIncomeAndExpenseState
    extends State<PieChartForIncomeAndExpense> {
  double income = 0;

  double expense = 0;

  List<PieChartSectionData> dataSet = [];

  List<TransactionModel> data = [];

  double incomePercentage = 0;
  double expensePercentage = 0;
  List<double> incomeList = [];
  List<double> expenseList = [];

  setValue() async {
    data = await TransactionDB.instance.getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    setValue();

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'income',
            style: GoogleFonts.poppins(color: Colors.green, fontSize: 25),
          ),
          SizedBox(
            height: 350,
            child: data.isEmpty
                ? Center(
                    child: Text(
                      'no transactions !!!',
                      style:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                    ),
                  )
                : PieChart(PieChartData(
                    centerSpaceRadius: 0,
                    sections: getIncomeChartData(),
                  )),
          ),
          data.isEmpty
              ? const SizedBox()
              : Container(
                  height: 215,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[800],
                    child: ListView.separated(
                      itemCount: CategoryDB
                          .instance.incomeCategoryListListner.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              (index + 1).toString(),
                              style: GoogleFonts.poppins(
                                color:
                                    index % 2 == 0 ? Colors.grey : Colors.green,
                              ),
                            ),
                          ),
                          title: Text(CategoryDB.instance
                              .incomeCategoryListListner.value[index].name),
                          titleTextStyle: GoogleFonts.poppins(
                              color:
                                  index % 2 == 0 ? Colors.grey : Colors.green,
                              fontSize: 17),
                          trailing: Text(
                            '${incomeList[index].toStringAsFixed(1)} %',
                            style: GoogleFonts.poppins(
                                color:
                                    index % 2 == 0 ? Colors.grey : Colors.green,
                                fontSize: 15),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            height: 45,
          ),
          Text(
            'expense',
            style: GoogleFonts.poppins(color: Colors.red, fontSize: 25),
          ),
          SizedBox(
            height: 350,
            child: data.isEmpty
                ? Center(
                    child: Text(
                      'no transactions !!!',
                      style:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                    ),
                  )
                : PieChart(PieChartData(
                    centerSpaceRadius: 0,
                    sections: getExpenseChartData(),
                  )),
          ),
          data.isEmpty
              ? const SizedBox()
              : Container(
                  height: 215,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[800],
                    child: ListView.separated(
                      itemCount: CategoryDB
                          .instance.expenseCategoryListListner.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              (index + 1).toString(),
                              style: GoogleFonts.poppins(
                                color:
                                    index % 2 == 0 ? Colors.grey : Colors.red,
                              ),
                            ),
                          ),
                          title: Text(CategoryDB.instance
                              .expenseCategoryListListner.value[index].name),
                          titleTextStyle: GoogleFonts.poppins(
                              color: index % 2 == 0 ? Colors.grey : Colors.red,
                              fontSize: 17),
                          trailing: Text(
                            '${expenseList[index].toStringAsFixed(1)} %',
                            style: GoogleFonts.poppins(
                                color:
                                    index % 2 == 0 ? Colors.grey : Colors.red,
                                fontSize: 15),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> getIncomeChartData() {
    dataSet = [];
    incomeList.clear();
    for (int i = 0;
        i < CategoryDB.instance.incomeCategoryListListner.value.length;
        i++) {
      income = 0;
      for (int j = 0; j < data.length; j++) {
        if (CategoryDB.instance.incomeCategoryListListner.value[i].name ==
            data[j].category.name) {
          income = income + data[j].amount;
        }
      }

      incomeList.add(
        (BalanceCalculate.instance.totalIncome != 0 &&
                BalanceCalculate.instance.totalIncome != null)
            ? (income / BalanceCalculate.instance.totalIncome!) * 100
            : 0,
      );
      dataSet.add(PieChartSectionData(
        value: income,
        color: i % 2 == 0 ? Colors.grey : Colors.green,
        titleStyle: GoogleFonts.poppins(color: Colors.black),
        title: (i + 1).toString(),
        radius: 140,
      ));
    }
    return dataSet;
  }

  List<PieChartSectionData> getExpenseChartData() {
    dataSet = [];
    expenseList.clear();

    for (int i = 0;
        i < CategoryDB.instance.expenseCategoryListListner.value.length;
        i++) {
      expense = 0;
      for (int j = 0; j < data.length; j++) {
        if (CategoryDB.instance.expenseCategoryListListner.value[i].name ==
            data[j].category.name) {
          expense = expense + data[j].amount;
        }
      }
      expenseList.add(
        (BalanceCalculate.instance.totalExpense != 0 &&
                BalanceCalculate.instance.totalExpense != null)
            ? (expense / BalanceCalculate.instance.totalExpense!) * 100
            : 0,
      );

      dataSet.add(PieChartSectionData(
        value: expense,
        color: i % 2 == 0 ? Colors.grey : Colors.red,
        titleStyle: GoogleFonts.poppins(color: Colors.black),
        title: (i + 1).toString(),
        radius: 140,
      ));
    }
    return dataSet;
  }

  @override
  void initState() {
    BalanceCalculate.instance.getTotalBalance();
    callSetState();
    super.initState();
  }

  callSetState() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
  }
}
