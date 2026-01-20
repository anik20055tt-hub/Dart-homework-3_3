import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_todo_view_model.dart';
import 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final AddTodoViewModel viewModel;
  AddTodoCubit({required this.viewModel}) : super(AddTodoInitial());

  Future<void> addTodo(String title) async {
    try {
      await viewModel.addTodo(title);
      emit(AddTodoSuccess());
    } catch (e) {
      emit(AddTodoError(e.toString()));
    }
  }
}
