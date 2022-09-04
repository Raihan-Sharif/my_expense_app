import 'package:flutter/material.dart';
import '../models/transactions.dart';
import './transaction_list.dart';

import './new_transation.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  List<Transactions> _transactionList = [
    Transactions(
      id: 1,
      title: 'Buy Shirt',
      amount: 1500,
      date: DateTime.now(),
    ),
    Transactions(
      id: 2,
      title: 'Buy Book',
      amount: 1200,
      date: DateTime.now().add(const Duration(days: 50)),
    ),
    Transactions(
      id: 3,
      title: 'Transportation',
      amount: 2000,
      date: DateTime.now(),
    ),
    Transactions(
      id: 4,
      title: 'House Rent',
      amount: 1200,
      date: DateTime.now().add(const Duration(days: -5)),
    ),
    Transactions(
      id: 5,
      title: 'Food',
      amount: 10000,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    var maxId = _transactionList.reduce(
        (currentTx, nextTx) => currentTx.id > nextTx.id ? currentTx : nextTx);

    final newTx = Transactions(
        id: 10, title: txTitle, amount: txAmount, date: DateTime.now());

    setState(() {
      _transactionList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(_transactionList),
      ],
    );
  }
}
