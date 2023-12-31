import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/dropdown_calculations.dart';
import '../../../models/watchlist_model.dart';
import '../../../repositories/watchlist/watchlist_repo.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitial()) {
    List<List<WatchListModel>> watchlistfiltered = [];
    on<WatchlistEvent>((event, emit) async {});

    on<WatchlistLoadingEvent>((event, emit) async {
      final Watchlistrepo watchListrepo = Watchlistrepo();
      emit(WatchListLoadingState());
      try {
        List<WatchListModel> watchlistdata;
        watchlistdata = await watchListrepo.watchlistrepo();
        int watchlistlen =
            WatchListCalculations().watchlistlength(watchlistdata);
        List<Map<String, dynamic>> dropdownlist =
            WatchListCalculations().dropdownlist(watchlistlen);

        watchlistfiltered = WatchListCalculations()
            .watchlistFiltered(watchlistdata, int.parse(twentyone.toString()));
        dynamic watchlistdataa = watchlistfiltered[0].toList();
        emit(WatchListLoadedState(watchlistdataa, dropdownlist));
      } catch (e) {
        emit(const WatchlistErrorState(nodatafound));
      }
    });

    on<WatchListFilterEvent>((event, emit) {
      List<WatchListModel> watchlistdata;
      watchlistdata = watchlistfiltered[event.selectedcontactValue];
      emit(WatchlistFilterState(event.selectedcontactValue, watchlistdata));
    });

    on<WatchListSearchingEvent>(
      (event, emit) {
        emit(WatchListSearchLoadingState());

        try {
          List<WatchListModel> clist =
              watchlistfiltered[event.selectedcontactValue];
          List<WatchListModel> slist =
              watchlistfiltered[event.selectedcontactValue];

          List<WatchListModel> sortedgrouplist = [];

          if (event.searchedname.isEmpty) {
            slist = watchlistfiltered[event.selectedcontactValue];
          } else {
            for (int i = 0; i < clist.length; i++) {
              if ((clist[i].name)
                  .toString()
                  .toLowerCase()
                  .contains(event.searchedname.toLowerCase())) {
                sortedgrouplist.add(clist[i]);
              }
            }
            slist = sortedgrouplist;
          }

          emit(WatchlistSearchedState(slist));
          // ignore: empty_catches
        } catch (e) {}
      },
    );

    on<WatchListItemHovering>((event, emit) async {
      emit(WatchlistHoveringState(
        hover: event.hover,
      ));
    });
    on<WatchListToggled>((event, emit) {
      print('toggle ${event.isToggled}');
      emit(WatchlistToggledState(
        isToggled: event.isToggled,
      ));
    });

    on<WatchlistChangeColorEvent>((event, emit) async {
      emit(WatchlistChangeColorState(
        btnName: event.btnName,
      ));
    });

    on<OnSortWidgetEvent>((event, emit) {
      // emit(WatchlistLoadingEvent() as WatchlistState);
      sortUsers(event.selectedSort ?? "", event.filteredusers);

      var sortedUsers =
          sortUsers(event.selectedSort ?? "", event.filteredusers);

      emit(FilterdState(
          filteredusers: sortedUsers ?? [],
          currentTabIndex: event.currentTabIndex,
          selectedSort: event.selectedSort));
    });
  }

  List<WatchListModel>? sortUsers(
      String sortType, List<WatchListModel>? users) {
    List<WatchListModel>? sortedUsers;

    if (users != null) {
      if (sortType == 'asc') {
        users.sort(
            (a, b) => int.parse(a.id ?? "").compareTo(int.parse(b.id ?? "")));
        sortedUsers = users;
      } else if (sortType == 'dsc') {
        users.sort(
            (b, a) => int.parse(a.id ?? "").compareTo(int.parse(b.id ?? "")));

        sortedUsers = users;
      }
    }

    return sortedUsers;
  }
}
