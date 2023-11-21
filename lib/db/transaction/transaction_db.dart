// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_test/models/category/category_model.dart';
import 'package:sample_test/models/transaction/transaction_model.dart';
import 'package:sample_test/screens/transactions/filter%20by%20selected%20date.dart/selected_date.dart';
import 'package:sample_test/screens/transactions/drop%20down%20for%20type/filter_data.dart';

const transactionDBName = 'transaction-database';

class TransactionDB {
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListListner =
      ValueNotifier([]);

  ValueNotifier<List<TransactionModel>> transactionrecentListListner =
      ValueNotifier([]);

  insertTransaction(TransactionModel value) async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    await _transactionDB.put(value.id, value);
    refreshUI();
    refrechUiForRecent();
  }

  Future<List<TransactionModel>> getTransaction() async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    return _transactionDB.values.toList();
  }

  deleteTransaction(String transactionID) async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    await _transactionDB.delete(transactionID);
    refreshUI();
    refrechUiForRecent();
  }

  updateTransaction(TransactionModel value) async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    await _transactionDB.put(value.id, value);
    refreshUI();
    refrechUiForRecent();
  }

  Future<void> clearAllTransaction() async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    await _transactionDB.clear(); // This will remove all entries from the box
    refreshUI();
    refrechUiForRecent();
  }

  refrechUiForRecent() async {
    var _allTransaction = await getTransaction();
    transactionrecentListListner.value.clear();
    transactionrecentListListner.value.addAll(_allTransaction);

    transactionrecentListListner.notifyListeners();
  }

  refreshUI() async {
    int i = FilterListData.instance.dropDownSelectedValueListner.value;

    var _allTransaction = await getTransaction();
    transactionListListner.value.clear();
    transactionListListner.value.addAll(_allTransaction);

    //filter by selected date
    if (SelectedDate.instance.selectedDateRangeStart != null) {
      DateTime startDateTime = DateTime(
          SelectedDate.instance.startingDateyear!,
          SelectedDate.instance.startingDatemonth!,
          SelectedDate.instance.startingDateday! -
              1); // User-provided start date
      DateTime endDateTime = DateTime(
          SelectedDate.instance.endingDateyear!,
          SelectedDate.instance.endingDatemonth!,
          SelectedDate.instance.endingDateday! + 1); // User-provided end date

      transactionListListner.value.clear();
      for (int i = 0; i < _allTransaction.length; i++) {
        if (_allTransaction[i].date.isAfter(startDateTime) &&
            _allTransaction[i].date.isBefore(endDateTime)) {
          transactionListListner.value.add(_allTransaction[i]);
        }
      }
    }

    switch (i) {
      case 0:
        transactionListListner.value
            .sort((first, second) => second.date.compareTo(first.date));
        break;
      case 1:
        transactionListListner.value.clear();
        for (int i = 0; i < _allTransaction.length; i++) {
          if (_allTransaction[i].type == CategoryType.income) {
            transactionListListner.value.add(_allTransaction[i]);
          }
        }
        break;
      case 2:
        transactionListListner.value.clear();
        for (int i = 0; i < _allTransaction.length; i++) {
          if (_allTransaction[i].type == CategoryType.expense) {
            transactionListListner.value.add(_allTransaction[i]);
          }
        }
        break;
      // case 3:
      //   transactionListListner.value.clear();
      //   for (int i = 0; i < _allTransaction.length; i++) {
      //     if (_allTransaction[i].date.day == DateTime.now().day) {
      //       transactionListListner.value.add(_allTransaction[i]);
      //     }
      //   }
      //   break;
      // case 4:
      //   transactionListListner.value.clear();
      //   for (int i = 0; i < _allTransaction.length; i++) {
      //     if (_allTransaction[i].date.month == DateTime.now().month) {
      //       transactionListListner.value.add(_allTransaction[i]);
      //     }
      //   }
      //   break;
      // case 5:
      //   transactionListListner.value.clear();
      //   List<TransactionModel> sortedTransactions = List.from(_allTransaction);
      //   for (int i = 0; i < sortedTransactions.length - 1; i++) {
      //     for (int j = i + 1; j < sortedTransactions.length; j++) {
      //       if (sortedTransactions[i].amount < sortedTransactions[j].amount) {
      //         // Swap the transactions if the amount is in descending order
      //         final temp = sortedTransactions[i];
      //         sortedTransactions[i] = sortedTransactions[j];
      //         sortedTransactions[j] = temp;
      //       }
      //     }
      //   }
      //   transactionListListner.value.addAll(sortedTransactions);
      //   break;
    }

    transactionListListner.notifyListeners();
  }
}
