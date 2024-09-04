part of 'dishes_bloc.dart';

class DishesState {
  final List<Dish> dishes;
  final int currentPage;
  final int totalPages;

  DishesState({
    required this.dishes,
    required this.currentPage,
    required this.totalPages,
  });
}
