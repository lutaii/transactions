import 'package:flutter/material.dart';

class TotalTransactionsAvatar extends StatelessWidget {
  const TotalTransactionsAvatar({
    Key? key,
    required this.transactionsCount,
  }) : super(key: key);

  final int transactionsCount;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      child: Text(
        transactionsCount.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
