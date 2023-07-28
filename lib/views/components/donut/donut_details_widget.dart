import 'package:flutter/material.dart';
import 'package:transactions/utils/extensions/extensions.dart';

import '../../../models/donut_data.dart';

class DonutDetailsWidget extends StatelessWidget {
  const DonutDetailsWidget(
    this.data, {
    Key? key,
  }) : super(key: key);

  final List<DonutData> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: data[index].transactionType.color(),
              ),
              const SizedBox(width: 20),
              Text(
                '${data[index].transactionType.name} (${data[index].total.toStringAsFixed(2)})',
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      },
    );
  }
}
