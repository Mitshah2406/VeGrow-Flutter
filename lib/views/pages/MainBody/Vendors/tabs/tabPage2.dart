// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person implements Comparable<Person> {
  final String name, surname;
  final num age;

  const Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}





class tabPage2 extends StatefulWidget {
  static const people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];

  const tabPage2({super.key});

  @override
  State<tabPage2> createState() => _tabPage2State();
}

class _tabPage2State extends State<tabPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      // body: ListView.builder(
      //   itemCount: tabPage2.people.length,
      //   itemBuilder: (context, index) {
      //     final person = tabPage2.people[index];

      //     return ListTile(
      //       title: Text(person.name),
      //       subtitle: Text(person.surname),
      //       trailing: Text('${person.age} yo'),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Search people',
      //   onPressed: () => showSearch(
      //     context: context,
      //     delegate: SearchPage(
      //       onQueryUpdate: print,
      //       items: tabPage2.people,
      //       searchLabel: 'Search people',
      //       suggestion: const Center(
      //         child: Text('Filter people by name, surname or age'),
      //       ),
      //       failure: const Center(
      //         child: Text('No person found :('),
      //       ),
      //       filter: (person) => [
      //         person.name,
      //         person.surname,
      //         person.age.toString(),
      //       ],
      //       sort: (a, b) => a.compareTo(b),
      //       builder: (person) => ListTile(
      //         title: Text(person.name),
      //         subtitle: Text(person.surname),
      //         trailing: Text('${person.age} yo'),
      //       ),
      //     ),
      //   ),
      //   child: const Icon(Icons.search),
      // ),
    );
  }
}
