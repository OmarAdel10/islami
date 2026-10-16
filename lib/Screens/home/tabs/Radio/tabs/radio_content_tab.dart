import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Screens/home/tabs/Radio/items/radio_item.dart';
import 'package:islami/features/radio/cubit/radio_cubit.dart';
import 'package:islami/features/radio/cubit/radio_state.dart';

class RadioContentTab extends StatelessWidget {
  const RadioContentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error != null) {
          return Center(
            child: Text(
              'Error: ${state.error}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state.reciters.isEmpty) {
          return const Center(child: Text('No reciters available'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (_, index) {
            final reciter = state.reciters[index];
            return RadioItem(radioNameText: reciter.name, reciter: reciter);
          },
          itemCount: state.reciters.length,
          separatorBuilder: (context, index) =>
              const Divider(color: Colors.transparent),
        );
      },
    );
  }
}
