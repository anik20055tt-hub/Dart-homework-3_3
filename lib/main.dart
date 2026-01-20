import 'package:flutter/material.dart';
import '/todo_repository.dart';
import 'mock_database.dart';
import 'home/home_page.dart';

void main() {
  // Общий экземпляр базы и репозитория
  final db = MockDatabase();
  final repo = TodoRepositoryImpl(db);

  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  final TodoRepository repo;
  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Список задач', repo: repo),
    );
  }
}

