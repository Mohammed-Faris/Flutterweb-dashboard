part of 'watchlist_bloc.dart';

abstract class WatchlistState {
  const WatchlistState();
}

class WatchlistInitial extends WatchlistState {}

class WatchListLoadingState extends WatchlistState {}

class WatchListLoadedState extends WatchlistState {
  // final List<List<WatchListModel>> watchlistdata;
  final List<WatchListModel> watchlistdata;
  final List<Map<String, dynamic>> dropdownlist;

  const WatchListLoadedState(this.watchlistdata, this.dropdownlist);

  List<Object> get props => [watchlistdata, dropdownlist];
}

class WatchlistFilterState extends WatchlistState {
  final int selectedcontactValue;
  final List<WatchListModel> watchlistdata;
  const WatchlistFilterState(this.selectedcontactValue, this.watchlistdata);

  List<Object> get props => [selectedcontactValue, watchlistdata];
}

class WatchlistErrorState extends WatchlistState {
  final String errormessage;
  const WatchlistErrorState(this.errormessage);

  List<Object> get props => [errormessage];
}

class WatchListSearchLoadingState extends WatchlistState {}

class WatchlistSearchedState extends WatchlistState {
  final List<WatchListModel> searchedlist;

  const WatchlistSearchedState(this.searchedlist);
}

class WatchlistHoveringState extends WatchlistState {
  bool hover;
  WatchlistHoveringState({
    this.hover = false,
  });
}

class WatchlistToggledState extends WatchlistState {
  bool isToggled;
  WatchlistToggledState({
    this.isToggled = false,
  });
}
