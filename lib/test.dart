import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting/test_cubit/test_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit()..fetchproduct(),
      child: Scaffold(
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
                return ListView.builder(
                  itemCount: state.model.length,
                  itemBuilder: (context, index) {
                    return CustomItem(
                      model: state.model[index],
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.model});
  final dynamic model;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(model['title']),
        Image.network(model['image']),
      ]),
    );
  }
}
