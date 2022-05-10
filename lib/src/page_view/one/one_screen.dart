import 'package:flutter/material.dart';
import 'package:flutter_300_400/src/page_view/one/cubit/one_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneScreen extends StatelessWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() => context.read<OneCubit>().fetch()),
      ),
      body: BlocBuilder<OneCubit, OneState>(
        builder: (context, state) {
          debugPrint('build istadi BlocBuilderOnePage');
          if (state is OneInitial) {
            return const Text('initial');
          } else if (state is OneLoading) {
            return const CircularProgressIndicator();
          } else if (state is OneSuccess) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final post = state.data[index];
                return ListTile(
                  leading: Text('${post.id}'),
                  title: Text(post.title),
                );
              },
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
