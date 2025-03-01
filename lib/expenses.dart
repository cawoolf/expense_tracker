import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount: 15.69, date: DateTime.now(), category: Category.leisure),
    Expense(title: 'Gym Membership', amount: 95.99, date: DateTime(2025,3,1), category: Category.leisure),
    Expense(title: 'Sushi', amount: 19.99, date: DateTime(2025,2,28), category: Category.work),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(body: Column(
     children: [
       Text('The chart'),

     ],
   ));
  }
}
