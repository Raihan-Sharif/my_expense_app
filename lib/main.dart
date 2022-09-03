import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Expense App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              color: Colors.amberAccent,
              child: Text(
                "Chart",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title,'),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount,'),
                  controller: amountController,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {print(titleController.text)},
            child: Text(
              'Add Transactions',
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
              elevation: MaterialStateProperty.all(10),
            ),
          ),
          Column(
            children: myTransactionList.map((tx) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 1,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${tx.amount.toString()} BDT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat().add_yMMMd().format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
