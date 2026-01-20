import '../todo.dart';

class MockDatabase {
  final List<Todo> _items = [];
  int _nextId = 1;

  Future<Todo> add(String title, int date) async {
    final todo = Todo(
      id: _nextId++,
      title: title,
      isFinished: false,
      date: date,
    );
    _items.add(todo);
    return todo;
  }

  Future<List<Todo>> fetchAll() async {
    return _items;
  }
}
