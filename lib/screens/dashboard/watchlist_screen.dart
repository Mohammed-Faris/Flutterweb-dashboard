import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_evaluation/bloc/bloc/watchlist/watchlist_bloc.dart';
import 'package:web_evaluation/models/watchlist_model.dart';
import 'package:web_evaluation/screens/dashboard/chart_screen.dart';
import 'package:web_evaluation/screens/dashboard/contactlist.dart';
import 'package:web_evaluation/widgets/logout.dart';
import 'package:web_evaluation/widgets/sort.dart';
import 'package:web_evaluation/widgets/text_widget.dart';

import '../../constants/app_constants.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen>
    with TickerProviderStateMixin {
  List<dynamic> searchedlist = [];
  List<Map<String, dynamic>> dropdownlist = [];
  int selectedcontactValue = 0;

  List<WatchListModel> allList = [];
  late TabController _tabController;
  late final List<List<WatchListModel>> filteredusers = [];

  TextEditingController searchnamecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WatchlistBloc>(context).add(WatchlistLoadingEvent());
  }

  Future<bool> onBack() async {
    return (navigator()) ?? false;
  }

  navigator() {
    LogoutWidget;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
      if (state is WatchListLoadingState || state is WatchlistInitial) {
        if (state is WatchListLoadingState) {
          selectedcontactValue = 0;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WatchListLoadedState) {
        searchedlist = state.watchlistdata;

        allList = state.watchlistdata;

        _tabController =
            TabController(length: state.watchlistdata.length, vsync: this);
        dropdownlist = state.dropdownlist;
      } else if (state is WatchListSearchLoadingState) {
      } else if (state is WatchlistSearchedState) {
        searchedlist = state.searchedlist;
      } else if (state is WatchlistFilterState) {
        selectedcontactValue = state.selectedcontactValue;
        searchedlist = state.watchlistdata;
        allList = state.watchlistdata;
      }

      return Row(
        children: [
          Expanded(
              flex: two.toInt(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: twenty, right: twenty),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width:
                                one / six * MediaQuery.of(context).size.width,
                            child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                value: selectedcontactValue,
                                items: dropdownlist
                                    .map((e) => DropdownMenuItem(
                                          value: e["value"],
                                          child: Text(e["text"].toString()),
                                        ))
                                    .toList(),
                                onChanged: ((value) {
                                  selectedcontactValue =
                                      int.parse(value.toString());
                                  BlocProvider.of<WatchlistBloc>(context).add(
                                      WatchListFilterEvent(
                                          selectedcontactValue));
                                })),
                          ),
                          GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => SortWidget(
                                      allList: allList,
                                      controller: _tabController,
                                    )),
                            child: SizedBox(
                              child: SvgPicture.asset(
                                settings,
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: ten, bottom: twenty),
                        child: SizedBox(
                          height: fifty,
                          child: TextField(
                            onSubmitted: (values) {
                              TextInput.finishAutofillContext();
                            },
                            controller: searchnamecontroller,
                            autofillHints: const [AutofillHints.email],
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greycolor)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: greycolor)),
                            ),
                            onChanged: (value) {
                              BlocProvider.of<WatchlistBloc>(context)
                                  .add(WatchListSearchingEvent(
                                value.toLowerCase(),
                                selectedcontactValue,
                              ));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: searchedlist.isEmpty
                            ? const Center(
                                child: TextWidget(
                                  textString: nodatafound,
                                  fontSize: fourteen,
                                  color: blackcolor,
                                ),
                              )
                            : ListView.builder(
                                itemCount: searchedlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ContactList(
                                    conlist: searchedlist[index],
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              )),
          const Expanded(flex: 6, child: ChartScreen()),
        ],
      );
    });
  }
}
