import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

//formatting date using intl package
//install it using flutter pub add intl
final formatter = DateFormat.yMd();

//download using flutter pub add uuid
const uuid = Uuid();

//custom type called Category that supports the written values
enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

//declaring variables to take user input
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    //initialize the id in constructor with uuid package
  }) : id = uuid.v4(); //generates a unique string id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double total = 0;
    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
