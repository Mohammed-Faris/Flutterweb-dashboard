import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_evaluation/bloc/bloc/watchlist/watchlist_bloc.dart';

import '../models/watchlist_model.dart';

// ignore: must_be_immutable
class SortWidget extends StatelessWidget {
  String? isSelected;
  final List<List<WatchListModel>> allList;
  final TabController controller;
  SortWidget(
      {super.key,
      this.isSelected,
      required this.allList,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchlistBloc, WatchlistState>(
      listener: (context, state) {
        if (state is FilterdState) {
          isSelected = state.selectedSort!;
        }
      },
      builder: (context, state) {
        return AlertDialog(
            content: SizedBox(
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'SortWidget By',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Row(
                  children: [
                    const Text('User ID'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.read<WatchlistBloc>().add(OnSortWidgetEvent(
                              currentTabIndex: controller.index,
                              selectedSort: 'asc',
                              filteredusers: allList,
                            ));
                      },
                      child: Text(
                        '0 \u{2193} 9',
                        style: TextStyle(
                            color: isSelected == null
                                ? Colors.black
                                : isSelected! == 'asc'
                                    ? Colors.blue
                                    : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<WatchlistBloc>().add(OnSortWidgetEvent(
                              currentTabIndex: controller.index,
                              selectedSort: 'dsc',
                              filteredusers: allList,
                            ));
                      },
                      child: Text(
                        '9 \u{2191} 0',
                        style: TextStyle(
                            color: isSelected == null
                                ? Colors.black
                                : isSelected! == 'dsc'
                                    ? Colors.blue
                                    : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle User ID SortWidgeting action
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
