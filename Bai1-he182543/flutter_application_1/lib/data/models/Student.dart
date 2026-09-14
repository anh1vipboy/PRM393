import 'package:flutter_application_1/data/models/Person.dart';

class Student extends Person {
  double math;
  double phis;
  double chemical;
  Student({
    required super.id,
    required super.name,
    this.math = 0,
    this.phis = 0,
    this.chemical = 0,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': this.id ?? "",
      'name': this.name ?? '',
      'math': this.math ?? 0,
      'phis': this.phis ?? 0,
      'chemical': this.chemical ?? 0,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return new Student(
      id: json['id'] as String,
      name: json['name'] as String,
      math: (json['math'] as num).toDouble(),
      phis: (json['phis'] as num).toDouble(),
      chemical: (json['chemical'] as num).toDouble(),
    );
  }
}
