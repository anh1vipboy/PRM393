
import 'package:flutter_application_1/data/models/Person.dart';

class Teacher extends Person{
  List<String>? subjects;
  Teacher({required super.id, required super.name, subjects = const[]});
}