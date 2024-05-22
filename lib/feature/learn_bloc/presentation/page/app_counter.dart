import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/feature/learn_bloc/presentation/bloc/counter_bloc.dart';
import 'package:learn_flutter/feature/learn_bloc/presentation/page/dec_counter.dart';
import 'package:learn_flutter/feature/learn_bloc/presentation/widget/center_number.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    final counterbloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterbloc.add(Increasemented());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Decrease()));
            },
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Counter App"),
      backgroundColor: Colors.blueGrey,
    );
  }

  _buildBody() {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        return CenterNumber(state);
      },
    );
  }
}
