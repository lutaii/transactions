import 'package:transactions/models/transactions_type.dart';

class Transaction {
  final int id;
  final String type;
  final double amount;
  final double commission;
  final String dateTime;

  Transaction({
    required this.id,
    required this.amount,
    required this.commission,
    required this.dateTime,
    required this.type,
  });

  double get finalAmount => amount + amount * commission;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      type: json['transactionType'],
      id: json['transactionNumber'],
      amount: json['amount'],
      commission: json['commission'].toDouble(),
      dateTime: json['dateTime'],
    );
  }

  TransactionType get transactionType {
    switch (type) {
      case 'deposit':
        return TransactionType.deposit;
      case 'transfer':
        return TransactionType.transfer;
      case 'withdrawal':
        return TransactionType.withdrawal;
      default:
        throw Exception('Unsupported transaction type');
    }
  }
}
