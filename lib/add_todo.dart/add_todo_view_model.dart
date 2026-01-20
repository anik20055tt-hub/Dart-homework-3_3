import '../todo_repository.dart';

class AddTodoViewModel {
  final TodoRepository repository;
  AddTodoViewModel({required this.repository});

  Future<void> addTodo(String title) async {
    final date = DateTime.now().millisecondsSinceEpoch;
    await repository.addTodo(title: title, date: date);
  }
}
