import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final int dishesPerPage = 6;

  DishesBloc() : super(DishesState(dishes: [], currentPage: 1, totalPages: 1)) {
    on<LoadDishes>(_onLoadDishes);
    on<NextPage>(_onNextPage);
    on<PreviousPage>(_onPreviousPage);
  }

  void _onLoadDishes(LoadDishes event, Emitter<DishesState> emit) {
    final allDishes = getDishes(); // Replace with your dish-fetching logic
    final totalPages = (allDishes.length / dishesPerPage).ceil();
    emit(DishesState(
      dishes: allDishes.take(dishesPerPage).toList(),
      currentPage: 1,
      totalPages: totalPages,
    ));
  }

  void _onNextPage(NextPage event, Emitter<DishesState> emit) {
    if (state.currentPage < state.totalPages) {
      final nextPage = state.currentPage + 1;
      final start = (nextPage - 1) * dishesPerPage;
      final end = start + dishesPerPage;

      emit(DishesState(
        dishes: getDishes().sublist(start, end > getDishes().length ? getDishes().length : end),
        currentPage: nextPage,
        totalPages: state.totalPages,
      ));
    }
  }

  void _onPreviousPage(PreviousPage event, Emitter<DishesState> emit) {
    if (state.currentPage > 1) {
      final previousPage = state.currentPage - 1;
      final start = (previousPage - 1) * dishesPerPage;
      final end = start + dishesPerPage;

      emit(DishesState(
        dishes: getDishes().sublist(start, end),
        currentPage: previousPage,
        totalPages: state.totalPages,
      ));
    }
  }
  List<Dish> getDishes() {
    return [
      Dish(name: 'Spaghetti Bolognese'),
      Dish(name: 'Grilled Chicken Salad'),
      Dish(name: 'Margherita Pizza'),
      Dish(name: 'Beef Tacos'),
      Dish(name: 'Vegetable Stir Fry'),
      Dish(name: 'Chicken Curry'),
      Dish(name: 'Lamb Kebabs'),
      // Dish(name: 'Fish and Chips'),
      // Dish(name: 'Tomato Soup'),
      // Dish(name: 'Cheeseburger'),
      // Dish(name: 'Pancakes'),
      // Dish(name: 'Caesar Salad'),
    ];
  }
}

class Dish {
  final String name;

  Dish({required this.name});
}
