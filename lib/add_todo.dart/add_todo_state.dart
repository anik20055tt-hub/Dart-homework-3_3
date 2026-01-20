abstract class AddTodoState {}
class AddTodoInitial extends AddTodoState {}
class AddTodoSuccess extends AddTodoState {}
class AddTodoError extends AddTodoState {
  final String message;
  AddTodoError(this.message);
}
