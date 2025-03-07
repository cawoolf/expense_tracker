import 'package:expense_tracker/common_widgets/new_expense.dart';
import 'package:expense_tracker/common_widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  //Dummy Data
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Gym Membership',
        amount: 95.99,
        date: DateTime(2025, 3, 1),
        category: Category.leisure),
    Expense(
        title: 'Sushi',
        amount: 19.99,
        date: DateTime(2025, 2, 28),
        category: Category.work),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense)); //ctx is the context related to the builder widget
  }

  void _addExpense(Expense expense) {
    setState(() {
    _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Expense Tracker'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay)
          ],
        ),
        body: Column(
          children: [
            Text('The Chart'),
            Expanded(
                child: ExpensesList(
              expenses: _registeredExpenses,
            ))
          ],
        ));
  }
}

/*
Notes

Column() inside of Column() usually needs the Expanded() widget. Flutter won't know how to size it correctly otherwise.
context is provided automatically in a Widget that extends State
Every widget has a context object
context contains Widget meta data, and information about it's location in the Widget tree
 */
