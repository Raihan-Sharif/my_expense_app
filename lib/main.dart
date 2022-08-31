import 'package:flutter/material.dart';
import 'package:my_expense_app/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Expense App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transactions> myTransactionList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Expense App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amberAccent,
              child: Text(
                "Chart",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
              width: 300,
              child: Column(
                children: myTransactionList.map((tx) {
                  return Card(
                    color: Colors.amber,
                    child: Text(
                      tx.title,
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}
