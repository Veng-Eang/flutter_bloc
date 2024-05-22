import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/core/routes/routes.dart';
import 'package:learn_flutter/feature/learn_bloc/presentation/bloc/counter_bloc.dart';
import 'package:learn_flutter/feature/learn_bloc/presentation/cubit/counter_cubit.dart';
import 'package:learn_flutter/feature/login_form/constant/pallete.dart';
import 'package:learn_flutter/feature/todo_app/cubit/todo_cubit.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => TodoCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learn Bloc state management',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        initialRoute: '/login',
        onGenerateRoute: (settings) => Routes.generateRout(settings),
      ),
    );
  }
}
