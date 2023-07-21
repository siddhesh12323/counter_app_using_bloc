import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../blocs/counter_bloc/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BlocConsumer<CounterCubit, CounterState>(
                builder: (context, state) {
              return Text(state.count.toString());
            }, listener: (context2, state) {
              if (state.changeFactor == -1) {
                showSnackBar("Decremented!", context);
              } else if (state.changeFactor == 1) {
                showSnackBar("Incremented!", context);
              } else if (state.changeFactor == 0) {
                showSnackBar("Cleared!", context);
              }
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    icon: const Icon(Icons.remove)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    icon: const Icon(Icons.add)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).clear();
                    },
                    icon: const Icon(Icons.delete)),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController showSnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 150),
    ));
  }
}
