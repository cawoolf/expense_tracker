import 'package:flutter/cupertino.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(expenses[index].title),
    );
  }
}

/*Notes
ListView() is automatically scroller.
ListView.builder() creates lists dynamically.
builder() takes a function for itemBuilder
itemCount defines how many calls are to be made to itemBuilder. Passes the index value to itemBuilder
Main effect of this code is to only create items for the list when needed. Can significantly improve performance for long lists

*/
