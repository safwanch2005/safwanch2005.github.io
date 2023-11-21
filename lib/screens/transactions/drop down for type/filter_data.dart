import 'package:flutter/material.dart';

class FilterListData {
  FilterListData._internal();
  static FilterListData instance = FilterListData._internal();

  factory FilterListData() {
    return instance;
  }
  ValueNotifier<int> dropDownSelectedValueListner = ValueNotifier(0);
}
