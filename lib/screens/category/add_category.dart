// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/db/category/category_db.dart';
import 'package:sample_test/models/category/category_model.dart';

class AddCatagory extends StatefulWidget {
  const AddCatagory({super.key});

  @override
  State<AddCatagory> createState() => _AddCatagoryState();
}

class _AddCatagoryState extends State<AddCatagory> {
  final _nameEditingController = TextEditingController();

  var _selectedCategoryType = CategoryType.income;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 180),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                'ADD\nCATEGORY',
                style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 45),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              //purpose
              controller: _nameEditingController,
              style: const TextStyle(color: Colors.green),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'category type',
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
                    value: _selectedCategoryType,
                    groupValue: CategoryType.income,
                    onChanged: (_) {
                      setState(() {
                        _selectedCategoryType = CategoryType.income;
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
                    value: _selectedCategoryType,
                    groupValue: CategoryType.expense,
                    onChanged: (_) {
                      setState(() {
                        _selectedCategoryType = CategoryType.expense;
                      });
                    }),
                Text(
                  'expense',
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    final _name = _nameEditingController.text;
                    if (_name.isEmpty) return;
                    final _category = CategoryModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: _name,
                        type: _selectedCategoryType);
                    CategoryDB().insertCategory(_category);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'save',
                    style: GoogleFonts.poppins(color: Colors.black),
                  )),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'back',
                    style: GoogleFonts.poppins(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
