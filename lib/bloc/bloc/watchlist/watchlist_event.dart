part of 'watchlist_bloc.dart';

class WatchlistEvent {
  const WatchlistEvent();

  List<Object> get props => [];
}

class WatchlistLoadingEvent extends WatchlistEvent {}

class WatchListFilterEvent extends WatchlistEvent {
  final int selectedcontactValue;

  const WatchListFilterEvent(this.selectedcontactValue);
  @override
  List<Object> get props => [selectedcontactValue];
}

class WatchListErrorEvent extends WatchlistEvent {}

class WatchListSearchingEvent extends WatchlistEvent {
  final String searchedname;
  final int selectedcontactValue;

  const WatchListSearchingEvent(this.searchedname, this.selectedcontactValue);
  @override
  List<Object> get props => [searchedname, selectedcontactValue];
}

class WatchListItemHovering extends WatchlistEvent {
  bool hover;

  WatchListItemHovering(
    this.hover,
  );
}

class WatchListToggled extends WatchlistEvent {
  bool isToggled;

  WatchListToggled(
    this.isToggled,
  );
}

class WatchlistChangeColorEvent extends WatchlistEvent {
  String btnName;
  WatchlistChangeColorEvent({
    required this.btnName,
  });
}

class OnSortWidgetEvent extends WatchlistEvent {
  final List<WatchListModel> filteredusers;

  final int currentTabIndex;

  final String? selectedSort;
  const OnSortWidgetEvent(
      {required this.filteredusers,
      required this.currentTabIndex,
      this.selectedSort});
}
