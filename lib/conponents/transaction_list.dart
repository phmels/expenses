import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_item.dart';

class TransactioList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  TransactioList(this.transaction, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constranints) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma Trasação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                Container(
                  height: constranints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (ctx, index) {
              final tr = transaction[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
