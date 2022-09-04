import 'package:flutter/material.dart';

typedef void MyCallback(String title, double amount);

class NewTransaction extends StatelessWidget {
  final MyCallback addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
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
          ElevatedButton(
            onPressed: () => {
              addTransaction(
                titleController.text,
                double.parse(amountController.text),
              )
            },
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
