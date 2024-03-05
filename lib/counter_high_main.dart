import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Counter(),
      ),
    ),
  ));
}
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count  =0 ;

  void _increment(){
    setState(() {
      ++_count;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterIncrementor(  onPressed: _increment,  ),
        const SizedBox(width: 16,),
        CounterDisplay(count:_count)
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('增加'),
    );
  }
}

