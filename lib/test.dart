import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting/test_cubit/test_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit(),
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<TestCubit>(context);
        cubit.fetchproduct();
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Home'),
            ),
            body: BlocConsumer<TestCubit, TestStates>(
              listener: (context, state) {
                if (state is TestStateSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fetch Success'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is TestStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TestStateSuccess) {
                  return Column(
                    children: [
                      Text(state.model.title),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        state.model.image,
                        width: 200,
                        height: 200,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ));
      }),
    );
  }
}
