import 'package:flutter/material.dart';

class IsDeleted {
  IsDeleted._internal();
  static IsDeleted instance = IsDeleted._internal();

  factory IsDeleted() {
    return instance;
  }

  ValueNotifier<int> isDeleted = ValueNotifier(0);
}
