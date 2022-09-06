import 'package:flutter/material.dart';

typedef void MyCallback(String title, double amount);

class NewTransaction extends StatefulWidget {
  final MyCallback addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void dataSubmitted() {
    final String title = titleController.text;
    final double amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      print('Data is not vaild!');
      return;
    } else {
      print('Data is vaild!');
    }
    widget.addTransaction(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title,'),
            controller: titleController,
            onSubmitted: (_) => dataSubmitted(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount,'),
            controller: amountController,
            onSubmitted: (_) => dataSubmitted(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          ElevatedButton(
            onPressed: () => dataSubmitted(),
            child: Text(
              'Add Transactions',
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
              elevation: MaterialStateProperty.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
