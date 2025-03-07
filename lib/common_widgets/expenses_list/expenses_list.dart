import 'package:expense_tracker/common_widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index])));
  }
}

/*Notes
ListView() is automatically scroller.
ListView.builder() creates lists dynamically.
builder() takes a function for itemBuilder
itemCount defines how many calls are to be made to itemBuilder. Passes the index value to itemBuilder
Main effect of this code is to only create items for the list when needed. Can significantly improve performance for long lists

key makes widgets uniquely identifiable. Most widgets don't have to worry about keys. Dismissible does to ensure correct data is deleted.

*/
