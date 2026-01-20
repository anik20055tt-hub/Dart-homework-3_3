import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../todo_repository.dart';
import '../add_todo.dart/add_todo_view.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'home_view_model.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final TodoRepository repo;
  const MyHomePage({super.key, required this.title, required this.repo});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    final vm = HomeViewModel(repo: widget.repo);
    cubit = HomeCubit(vm: vm)..init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isLoading) return const Center(child: CircularProgressIndicator());
            if (state.error != null) return Center(child: Text('Ошибка: ${state.error}'));
            if (state.items.isEmpty) return const Center(child: Text('Список пуст'));

            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final todo = state.items[index];
                return ListTile(
                  title: Text(todo.title),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddTodoView(repo: widget.repo)),
            );
            if (result == true) cubit.init();
          },
        ),
      ),
    );
  }
}
