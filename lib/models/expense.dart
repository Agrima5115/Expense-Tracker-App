import 'package:uuid/uuid.dart';

//download using flutter pub add uuid
const uuid = Uuid();

//custom type called Category that supports the written values
enum Category {
  food,
  travel,
  leisure,
  work,
}

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
}
