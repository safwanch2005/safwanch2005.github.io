import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/models/category/category_model.dart';
import 'package:sample_test/models/transaction/transaction_model.dart';

class BalanceCalculate {
  BalanceCalculate._internal();
  static BalanceCalculate instance = BalanceCalculate._internal();

  factory BalanceCalculate() {
    return instance;
  }

  double? netBalance = 0;
  double? totalIncome = 0;
  double? totalExpense = 0;

  getTotalBalance() async {
    List<TransactionModel> transactionData =
        await TransactionDB.instance.getTransaction();
    netBalance = 0;
    totalIncome = 0;
    totalExpense = 0;

    for (int i = 0; i < transactionData.length; i++) {
      netBalance = netBalance! + transactionData[i].amount;
      if (transactionData[i].type == CategoryType.income) {
        totalIncome = totalIncome! + transactionData[i].amount;
      } else {
        totalExpense = totalExpense! + transactionData[i].amount;
      }
    }
    netBalance = netBalance! - totalExpense! * 2;
  }
}
