import 'package:flutter/material.dart';

class TransactionsEmptyWidget extends StatelessWidget {
  const TransactionsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('There are no transactions on your account'),
    );
  }
}
