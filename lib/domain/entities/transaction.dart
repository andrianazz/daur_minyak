import 'package:freezed_annotation/freezed_annotation.dart';
import 'product.dart';
import 'picker.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String uid,
    required String title,
    required DateTime transactionDate,
    List<Product>? products,
    Picker? picker,
    String? transactionType,
    String? methodType,
    @Default(0.0) double rating,
    @Default(0) int status,
    int? total,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
