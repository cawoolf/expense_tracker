import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: _appBarTheme(),
        cardTheme: _cardTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
    textTheme: _textTheme()),
    home: const Expenses(),
  ));
}

TextTheme _textTheme() {
  return ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(fontWeight: FontWeight.normal, color: kColorScheme.onSecondaryContainer, fontSize: 14) // Title large is usually the title for appBars and other widgets
  );
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer); // Normally overrides any text color in the appBar
}

ElevatedButtonThemeData _elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer));
}

CardTheme _cardTheme() {
  return const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8));
}


// Notes
/* Using ThemeData().copyWith() preservers some of the Flutter default themes. Allows individual aspects to be configured.
colorScheme: is applied to several different widgets. Easy way to theme the app

Selective overrides of theme elements is the way to go.

k before variable name means it's global

use .styleFrom() as a .copyWith() technique for Buttons
*/
