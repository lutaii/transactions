import 'dart:convert';

import 'package:transactions/api/mock_json.dart';
import 'package:transactions/models/transaction.dart';
import 'package:transactions/utils/logger.dart';

import '../utils/exceptions/exceptions.dart';

abstract class Api {
  Future<List<Transaction>> getTransactions();
}

class MockApi extends Api {
  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final List<dynamic> jsonList = jsonDecode(jsonMock);
      logger.d('Transactions json has succsessfully decode');
      return jsonList.map((json) => Transaction.fromJson(json)).toList();
    } on ApiException catch (e) {
      logger.d('There is exception while getting transactions');
      throw ApiException(e.message);
    }
  }
}
