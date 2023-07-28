import 'package:flutter/material.dart';

import '../../models/transactions_type.dart';

extension TransactionTypeColor on TransactionType {
  Color color() {
    switch (this) {
      case TransactionType.deposit:
        return const Color(0xFF7FB500);
      case TransactionType.transfer:
        return const Color(0xFF5F6DDC);
      case TransactionType.withdrawal:
        return const Color(0xFFF68602);
    }
  }
}
