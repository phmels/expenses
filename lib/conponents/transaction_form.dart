import 'dart:ui';
import 'package:flutter/material.dart';

import 'adaptative_button.dart';
import 'adaptative_textfield.dart';
import 'adaptative_datapicker.dart';

class TransactionForm extends StatefulWidget {
  late final void Function(String, double, DateTime)? onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleContoler = TextEditingController();
  final _valueControler = TextEditingController();
  var _selectdDate = DateTime.now();

  _submitform() {
    final title = _titleContoler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectdDate == null) {
      return;
    }
    widget.onSubmit!(title, value, _selectdDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleContoler,
                onSubmitted: (_) => _submitform(),
                label: 'Titulo',
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitform(),
                controller: _valueControler,
              ),
              AdaptativeDataPicker(
                selectedDate: _selectdDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectdDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                      label: 'Nova Transação', onpressed: _submitform)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
