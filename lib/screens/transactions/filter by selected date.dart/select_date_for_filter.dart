// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sample_test/db/transaction/transaction_db.dart';
import 'package:sample_test/screens/transactions/filter%20by%20selected%20date.dart/selected_date.dart';

class SelectDateForFilter extends StatefulWidget {
  const SelectDateForFilter({super.key});

  @override
  State<SelectDateForFilter> createState() => _SelectDateForFilterState();
}

class _SelectDateForFilterState extends State<SelectDateForFilter> {
  @override
  void initState() {
    TransactionDB.instance.refreshUI();

    super.initState();
  }

  @override
  void dispose() {
    SelectedDate.instance.selectedDateRangeStart = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 10, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              await pickDateRange();

              if (SelectedDate.instance.selectedDateRangeStart == null) return;
              setState(() {});
              TransactionDB.instance.refreshUI();
            },
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.green,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  SelectedDate.instance.selectedDateRangeStart == null
                      ? '  select date range'
                      : '${DateFormat('MMM dd').format(SelectedDate.instance.selectedDateRangeStart!)} - ${DateFormat('MMM dd').format(SelectedDate.instance.selectedDateRangeEnd!)}',
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    SelectedDate.instance.selectedDateRangeStart = null;
                    TransactionDB.instance.refreshUI();
                    setState(() {});
                  },
                  child: Icon(
                    Icons.clear,
                    size: 20,
                    color: SelectedDate.instance.selectedDateRangeStart == null
                        ? Colors.black
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  pickDateRange() async {
    DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (dateRange == null) return;
    SelectedDate.instance.selectedDateRangeStart = dateRange.start;
    SelectedDate.instance.selectedDateRangeEnd = dateRange.end;
    //starting date
    SelectedDate.instance.startingDateyear = dateRange.start.year;
    SelectedDate.instance.startingDatemonth = dateRange.start.month;
    SelectedDate.instance.startingDateday = dateRange.start.day;
    //ending date
    SelectedDate.instance.endingDateyear = dateRange.end.year;
    SelectedDate.instance.endingDatemonth = dateRange.end.month;
    SelectedDate.instance.endingDateday = dateRange.end.day;

    setState(() {});
    print(dateRange.start.day);
    print(dateRange.end.day);
  }
}
