// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sample_test/db/category/category_db.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/models/category/category_model.dart';
import 'package:sample_test/models/transaction/transaction_model.dart';
import 'package:sample_test/screens/category/add_category.dart';
import 'package:sample_test/screens/transactions/add%20and%20edit/is_editmode.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;
  String? _categoryID;
  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();
  String _selectedCategoryModelName = '';

  @override
  void initState() {
    _selectedCategoryType = CategoryType.income;

    if (IsEditingMode.instance.isEditmode) {
      initEdit();
    }
    super.initState();
  }

  void initEdit() {
    final model = IsEditingMode.instance.modelForEdit!;
    setState(() {
      _purposeTextEditingController.text = model.purpose;
      _amountTextEditingController.text = model.amount.toString();
      _selectedDate = model.date;
      _selectedCategoryType = model.type;
      _selectedCategoryModel = model.category;
      _selectedCategoryModelName = model.category.name;
    });
  }

  @override
  void dispose() {
    IsEditingMode.instance.isEditmode = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: Column(
          children: [
            Text(
              IsEditingMode.instance.isEditmode
                  ? 'EDIT\nTRANSACTION'
                  : 'ADD\nTRANSACTION',
              style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              //purpose
              controller: _purposeTextEditingController,
              style: const TextStyle(color: Colors.green),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'purpose',
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 5, color: Colors.green),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              //amount
              controller: _amountTextEditingController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.green),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'amount',
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 5, color: Colors.green),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: CategoryType.income,
                    groupValue: _selectedCategoryType,
                    onChanged: (_) {
                      setState(() {
                        _selectedCategoryType = CategoryType.income;
                        _categoryID = null;
                        _selectedCategoryModelName = 'select category';
                      });
                    }),
                Text(
                  'income',
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 20),
                ),
                const SizedBox(
                  width: 15,
                ),
                Radio(
                    value: CategoryType.expense,
                    groupValue: _selectedCategoryType,
                    onChanged: (_) {
                      setState(() {
                        _selectedCategoryType = CategoryType.expense;
                        _categoryID = null;
                        _selectedCategoryModelName = 'select category';
                      });
                    }),
                Text(
                  'expense',
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 20),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCatagory()),
                  );
                },
                child: Text(
                  '+ Add new category',
                  style: GoogleFonts.poppins(fontSize: 18),
                )),
            DropdownButton(
                value: _categoryID,
                hint: Text(
                  IsEditingMode.instance.isEditmode
                      ? _selectedCategoryModelName
                      : 'select category',
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 17),
                ),
                items: (_selectedCategoryType == CategoryType.income
                        ? CategoryDB().incomeCategoryListListner
                        : CategoryDB().expenseCategoryListListner)
                    .value
                    .map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        _selectedCategoryModel = e;
                      },
                      value: e.id,
                      child: Text(
                        e.name,
                        style: GoogleFonts.poppins(
                            color: Colors.green, fontSize: 23),
                      ));
                }).toList(),
                onChanged: (selectedValue) {
                  setState(() {
                    _categoryID = selectedValue;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            //select Date
            TextButton.icon(
              onPressed: () async {
                final _selectedDateTemp = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );
                if (_selectedDateTemp == null) return;
                setState(() {
                  _selectedDate = _selectedDateTemp;
                });
              },
              icon: const Icon(Icons.calendar_today),
              label: Text(
                  _selectedDate == null
                      ? 'select date'
                      : DateFormat('MMM dd').format(_selectedDate!),
                  style: _selectedDate == null
                      ? GoogleFonts.poppins(fontSize: 18)
                      : GoogleFonts.poppins(fontSize: 22)),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () async {
                    if (IsEditingMode.instance.isEditmode) {
                      await editTransaction(
                          IsEditingMode.instance.modelForEdit!);
                    } else {
                      addTransaction();
                    }
                  },
                  child: Text(
                    IsEditingMode.instance.isEditmode ? 'save changes' : 'Add',
                    style: GoogleFonts.poppins(color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }

  editTransaction(TransactionModel value) async {
    var _purposeText = _purposeTextEditingController.text;
    var _amountText = _amountTextEditingController.text;

    if (_purposeText.isEmpty ||
        _amountText.isEmpty ||
        _selectedCategoryModel == null) {
      return;
    }
    final _parsedAmount = double.tryParse(_amountText);
    if (_parsedAmount == null) {
      return;
    }

    final _newDate = _selectedDate ?? value.date;

    final _model = TransactionModel(
      id: value.id,
      purpose: _purposeText,
      amount: _parsedAmount,
      date: _newDate,
      type: _selectedCategoryType!,
      category: _selectedCategoryModel!,
    );

    if (value.id != null) {
      _model.id = value.id;
      await TransactionDB.instance.updateTransaction(_model);
    } else {
      await TransactionDB.instance.insertTransaction(_model);
    }
    TransactionDB.instance.refreshUI();
    TransactionDB.instance.refrechUiForRecent();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade900,
        content: Text(
          '\' ${_purposeTextEditingController.text} \' saved changes',
          style: GoogleFonts.poppins(color: Colors.grey),
        )));
    setState(() {
      _purposeTextEditingController.text = '';
      _amountTextEditingController.text = '';
      _selectedCategoryType = CategoryType.income;
      _selectedDate = null;
      _categoryID = null;
      IsEditingMode.instance.isEditmode = false;
    });
    // Home.selectedIndexNotifier.value = 2;
  }

  addTransaction() async {
    var _purposeText = _purposeTextEditingController.text;
    var _amountText = _amountTextEditingController.text;
    if (_purposeText.isEmpty) {
      return;
    }
    if (_amountText.isEmpty) {
      return;
    }
    if (_selectedCategoryModel == null) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    final _parsedAmount = double.tryParse(_amountText);
    if (_parsedAmount == null) {
      return;
    }
    final _model = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      purpose: _purposeText,
      amount: _parsedAmount,
      date: _selectedDate!,
      type: _selectedCategoryType!,
      category: _selectedCategoryModel!,
    );
    await TransactionDB.instance.insertTransaction(_model);
    TransactionDB.instance.refreshUI();
    TransactionDB.instance.refrechUiForRecent();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade900,
        content: Text(
          '\' ${_purposeTextEditingController.text} \' added',
          style: GoogleFonts.poppins(color: Colors.grey),
        )));

    setState(() {
      _purposeTextEditingController.text = '';
      _amountTextEditingController.text = '';
      _selectedCategoryType = CategoryType.income;
      _selectedDate = null;
      _categoryID = null;
    });
  }
}
