

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dishes_bloc.dart';

void main(){
  runApp(MaterialApp(
    title: 'layout',
    home: Scaffold(
        appBar: AppBar(
          title: const Text('apptitle'),
        ),
        body:   DishesPage(),
    ),
  ));
}

class DishesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DishesBloc()..add(LoadDishes()),
      child: BlocBuilder<DishesBloc, DishesState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Display 3 buttons per row
                    childAspectRatio: 2,
                  ),
                  itemCount: state.dishes.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        // Handle dish selection
                      },
                      child: Text(state.dishes[index].name),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: state.currentPage > 1
                        ? () => context.read<DishesBloc>().add(PreviousPage())
                        : null,
                  ),
                  Text('${state.currentPage} / ${state.totalPages}'),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: state.currentPage < state.totalPages
                        ? () => context.read<DishesBloc>().add(NextPage())
                        : null,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}