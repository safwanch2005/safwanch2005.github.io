import 'package:sample_test/models/category/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 2)
class TransactionModel extends HiveObject {
  @HiveField(0)
  late String purpose;

  @HiveField(1)
  late double amount;

  @HiveField(2)
  late DateTime date;

  @HiveField(3)
  late CategoryType type;

  @HiveField(4)
  late CategoryModel category;

  @HiveField(5)
  String? id;

  TransactionModel({
    required this.id,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });
}
