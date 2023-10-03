import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/entities/transaction.dart';

abstract interface class TransactionRespository {
  Future<Result<Transaction>> createTransaction({
    required Transaction transaction,
  });

  Future<Result<List<Transaction>>> getUserTransactions({required String uid});
}
