import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../todo_repository.dart';
import 'add_todo_cubit.dart';
import 'add_todo_state.dart';
import 'add_todo_view_model.dart';

class AddTodoView extends StatefulWidget {
  final TodoRepository repo;
  const AddTodoView({super.key, required this.repo});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  late final AddTodoCubit cubit;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final vm = AddTodoViewModel(repository: widget.repo);
    cubit = AddTodoCubit(viewModel: vm);
  }

  @override
  void dispose() {
    controller.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Добавить задачу')),
        body: BlocListener<AddTodoCubit, AddTodoState>(
          listener: (context, state) {
            if (state is AddTodoSuccess) Navigator.pop(context, true);
            if (state is AddTodoError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(labelText: 'Название задачи'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => cubit.addTodo(controller.text),
                  child: const Text('Сохранить'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
