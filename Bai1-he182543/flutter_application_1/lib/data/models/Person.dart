import 'package:flutter_application_1/data/models/Student.dart';
import 'package:flutter_application_1/data/models/Teacher.dart';

enum PersonType{
  Student,
  Teacher
}
class Person{
  final String id;
  final String name;

  Person({required this.id, required this.name});
  factory Person.Create(PersonType pType, Map<String, dynamic> value){
    if(pType == PersonType.Teacher){
      return new Teacher(id: value["id"] as String, name: value["name"] as String);
    }
    else return Student.fromJson(value);
  }
}