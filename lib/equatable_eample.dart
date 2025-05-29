import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableEample extends StatefulWidget {
  const EquatableEample({super.key});

  @override
  State<EquatableEample> createState() => _EquatableEampleState();
}

class _EquatableEampleState extends State<EquatableEample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person = Person(name: 'Jim', age: 20);
          Person person1 = Person(name: 'Jim', age: 20);

          print(person.hashCode.toString());
          print(person1.hashCode.toString());

          print(person == person1);
        },
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
