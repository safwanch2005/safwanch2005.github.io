import 'package:sample_test/models/transaction/transaction_model.dart';

class IsEditingMode {
  IsEditingMode._internal();
  static IsEditingMode instance = IsEditingMode._internal();

  factory IsEditingMode() {
    return instance;
  }
  bool isEditmode = false;
  bool editDone = false;
  bool isDeleted = false;
  TransactionModel? modelForEdit;
}
