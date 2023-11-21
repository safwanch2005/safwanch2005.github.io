// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:intl/intl.dart';

class ParseDateToString {
  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitedDate = _date.split(' ');
    return '${_splitedDate.last}\n${_splitedDate.first}';
  }
}
