import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Screens/home/tabs/Radio/title_items.dart';
import 'package:islami/Screens/home/tabs/Radio/tabs/radio_content_tab.dart';
import 'package:islami/Screens/home/tabs/Radio/tabs/reciters_content_tab.dart';
import 'package:islami/appTheme.dart';
import 'package:islami/features/radio/cubit/radio_cubit.dart';
import 'package:islami/features/radio/cubit/radio_state.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = RadioCubit();
        cubit.loadReciters();
        return cubit;
      },
      child: const _RadioTabView(),
    );
  }
}

class _RadioTabView extends StatelessWidget {
  const _RadioTabView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        final List<Widget> tabs = [RadioContentTab(), RecitersContentTab()];

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppTheme.black.withValues(alpha: 0.7),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<RadioCubit>().setTabIndex(0);
                              },
                              child: TitleItems(
                                isselected: state.currentTabIndex == 0,
                                text: 'Radio',
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<RadioCubit>().setTabIndex(1);
                              },
                              child: TitleItems(
                                isselected: state.currentTabIndex == 1,
                                text: 'Reciters',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Expanded(child: tabs[state.currentTabIndex]),
          ],
        );
      },
    );
  }
}
