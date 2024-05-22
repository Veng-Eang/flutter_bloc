import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/feature/learn_bloc/presentation/bloc/counter_bloc.dart';
import 'package:learn_flutter/feature/learn_bloc/presentation/widget/center_number.dart';

class Decrease extends StatelessWidget {
  const Decrease({super.key});

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
              counterbloc.add(Decreasemented());
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.navigate_before),
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
