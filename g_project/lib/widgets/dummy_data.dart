import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {required this.id, required this.title, this.color = Colors.orange});
}

const DUMMY_CATEGORIES = const [

  Category(
    id: 'c1',
    title: 'Kasut badminton',
    color: Colors.purple,
  ),

  Category(
    id: 'c2',
    title: 'Raket',
    color: Colors.red,
  ),

  Category(
    id: 'c3',
    title: 'Net',
    color: Colors.orange,
  ),

  Category(
    id: 'c4',
    title: 'Bulu tangkis',
    color: Colors.amber,
  ),

  Category(
    id: 'c5',
    title: 'Tali raket',
    color: Colors.blue,
  ),

  Category(
    id: 'c6',
    title: 'Grip',
    color: Colors.green,
  ),

];

