import '../todo.dart';
import '../todo_repository.dart';

class HomeViewModel {
  final TodoRepository repo;
  HomeViewModel({required this.repo});

  Future<List<Todo>> getTodos() async {
    return repo.fetchList();
  }
}
