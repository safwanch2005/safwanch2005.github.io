import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/db/category/category_db.dart';
import 'package:sample_test/screens/category/add_category.dart';
import 'package:sample_test/screens/category/expense_categorylist.dart';
import 'package:sample_test/screens/category/income_categorylist.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool isSelectedIncome = true;

  @override
  void initState() {
    CategoryDB().refreshUI();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          isSelectedIncome
              ? const IncomeCategoryList()
              : const ExpenseCategoryList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelectedIncome = true;
                  });
                },
                child: Container(
                  width: 170,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(44, 158, 158, 158),
                  ),
                  child: Center(
                    child: isSelectedIncome
                        ? Text(
                            'income',
                            style: GoogleFonts.poppins(
                                color: Colors.green, fontSize: 13),
                          )
                        : Text(
                            'income',
                            style: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 13),
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelectedIncome = false;
                  });
                },
                child: Container(
                  width: 170,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(44, 158, 158, 158),
                  ),
                  child: Center(
                    child: isSelectedIncome
                        ? Text(
                            'expense',
                            style: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 13),
                          )
                        : Text(
                            'expense',
                            style: GoogleFonts.poppins(
                                color: Colors.red, fontSize: 13),
                          ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddCatagory()),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(44, 158, 158, 158),
              ),
              child: Center(
                child: Text(
                  '+ Add new category',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
