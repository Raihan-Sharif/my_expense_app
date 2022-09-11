import 'dart:ui';

import 'package:flutter/material.dart';
import './widgets/new_transation.dart';
import './widgets/transaction_list.dart';
import './models/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Expense App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle2: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
              bodyText1: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.amberAccent,
              ),
              bodyText2: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Bluetea',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transactions> _transactionList = [
    /* Transactions(
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
    */
  ];

  void _addTransaction(String txTitle, double txAmount) {
    var maxId = _transactionList.reduce(
        (currentTx, nextTx) => currentTx.id > nextTx.id ? currentTx : nextTx);

    final newTx = Transactions(
      id: 10,
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _transactionList.add(newTx);
    });
  }

  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () => {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Expense App"), actions: <Widget>[
        IconButton(
            onPressed: () => _startAddNewTransactions(context),
            icon: Icon(Icons.add_circle)),
      ]),
      floatingActionButton: IconButton(
          onPressed: () => _startAddNewTransactions(context),
          icon: Icon(Icons.add_circle)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Chart",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            _transactionList.isEmpty
                ? Container(
                    height: 500,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Sorry no data found. Please add first.',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Image.asset('assets/images/No_data.png'),
                      ],
                    ),
                  )
                : TransactionList(_transactionList),
          ],
        ),
      ),
    );
  }
}
