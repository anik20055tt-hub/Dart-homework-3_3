import '../mock_database.dart';
import '../todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchList();
  Future<Todo> addTodo({required String title, required int date});
}

class TodoRepositoryImpl implements TodoRepository {
  final MockDatabase db;
  TodoRepositoryImpl(this.db);

  @override
  Future<Todo> addTodo({required String title, required int date}) {
    return db.add(title, date);
  }

  @override
  Future<List<Todo>> fetchList() async {
    return List<Todo>.from(await db.fetchAll());
  }
}
