import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/screens/transactions/drop%20down%20for%20type/filter_data.dart';

class DropDownToFilter extends StatefulWidget {
  const DropDownToFilter({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DropDownToFilterState createState() => _DropDownToFilterState();
}

class _DropDownToFilterState extends State<DropDownToFilter> {
  int selectedValue = 0; // Initialize with the default value

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<int>(
          onChanged: (int? value) {
            TransactionDB.instance.refreshUI();
            setState(() {
              selectedValue = value!;
              FilterListData.instance.dropDownSelectedValueListner.value =
                  value;
            });
          },
          value: selectedValue, // Set the selected value
          hint: Text(
            'Filter',
            style: GoogleFonts.poppins(color: Colors.green, fontSize: 17),
          ),
          items: [
            DropdownMenuItem<int>(
                value: 0,
                child: Text(
                  'All',
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
            DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  'Income',
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
            DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  'Expense',
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
            // DropdownMenuItem<int>(
            //     value: 3,
            //     child: Text(
            //       'today',
            //       style: GoogleFonts.poppins(color: Colors.white),
            //     )),
            // DropdownMenuItem<int>(
            //     value: 4,
            //     child: Text(
            //       'this month',
            //       style: GoogleFonts.poppins(color: Colors.white),
            //     )),
            // DropdownMenuItem<int>(
            //     value: 5,
            //     child: Text(
            //       'high to low',
            //       style: GoogleFonts.poppins(color: Colors.white),
            //     )),
          ],
        ),
      ],
    );
  }
}
