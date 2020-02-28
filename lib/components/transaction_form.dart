﻿import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.00;

    if (title.isEmpty || value <= 0){
      return;
    }

    widget.onSubmit(title, value);


  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Título',
              ),
              controller: titleController,
              onSubmitted: (_) => _submitForm(), // Underline pois e evento exige um parâmetro para a função
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(), // Underline pois e evento exige um parâmetro para a função
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              controller: valueController,
            ),
            FlatButton(
              child: Text('Nova Transação'),
              //textColor: Colors.purple,
              textColor: Theme.of(context).primaryColor,
              //color: Theme.of(context).accentColor,
              //color: Colors.white,
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
