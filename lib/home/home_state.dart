import '../todo.dart';

class HomeState {
  final List<Todo> items;
  final bool isLoading;
  final String? error;

  const HomeState({required this.items, required this.isLoading, this.error});

  factory HomeState.initial() => const HomeState(items: [], isLoading: false);

  HomeState copyWith({
    List<Todo>? items,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
