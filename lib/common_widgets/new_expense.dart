import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart' as Expense;

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Expense.Category _selectedCategory = Expense.Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    // This line of code executes after the Future value is returned from await
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _titleField(),
            _amountRow(),
            SizedBox(height: 32.0),
            _bottomRow(context)
          ],
        ));
  }

  TextField _titleField() {
    return TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          );
  }

  Row _bottomRow(BuildContext context) {
    return Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                  items: Expense.Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              SizedBox(width: 24.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Pops the model off the stack
                  },
                  child: Text('Cancel')),
              SizedBox(width: 24.0),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text('Save Expense'))
            ],
          );
  }

  Row _amountRow() {
    return Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixText: '\$ ', label: Text('Amount')),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ))
            ],
          );
  }
}

/*
Notes

TextField() widget is used for Text inputs. Lots of different formatting options
onChanged in the TextField() is called on every ket stroke
Controllers() are very useful for managing inputs. Can store and display values.
Always call dispose() on all controllers. Can live on in memory after the widget is destroyed
 */
