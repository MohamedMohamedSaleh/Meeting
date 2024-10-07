import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting/test_cubit/test_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit(),
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<TestCubit>(context);

        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Home'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    FilledButton(
                      onPressed: () {
                        cubit.increment();
                      },
                      child: const Text('Increment'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    BlocBuilder<TestCubit, TestStates>(
                      builder: (context, state) {
                        return Text(cubit.counter.toString());
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FilledButton(
                      onPressed: () {
                        cubit.decrement();
                      },
                      child: const Text('Decrement'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  onPressed: () {
                    cubit.reset();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ));
      }),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
