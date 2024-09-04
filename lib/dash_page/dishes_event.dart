part of 'dishes_bloc.dart';

// Event
abstract class DishesEvent {}

class LoadDishes extends DishesEvent {}

class NextPage extends DishesEvent {}

class PreviousPage extends DishesEvent {}

