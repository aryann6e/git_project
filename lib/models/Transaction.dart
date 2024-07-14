import 'package:hive/hive.dart';
part 'Transaction.g.dart';

@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  String? Product_name;
  @HiveField(1)
  num? Amount;
  @HiveField(2)
  DateTime? date;
  @HiveField(3)
  String? Id;
  Transaction({
    required this.Product_name,
    required this.Amount,
    required this.Id,
    required this.date,
  });
}
