import '../todo_repository.dart';
import '../todo.dart';

class HomeViewModel {
  final TodoRepository repo;
  HomeViewModel({required this.repo});

  Future<List<Todo>> loadList() => repo.fetchList();
}
