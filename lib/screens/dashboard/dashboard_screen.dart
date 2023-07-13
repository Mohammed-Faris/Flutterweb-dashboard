import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:web_evaluation/bloc/bloc/internet/bloc/internet_bloc.dart';
import 'package:web_evaluation/bloc/bloc/watchlist/watchlist_bloc.dart';
import 'package:web_evaluation/constants/singleton.dart';
import 'package:web_evaluation/screens/overlay/overlay_screen.dart';
import 'package:web_evaluation/widgets/logout.dart';

import '../../constants/app_constants.dart';

// ignore: must_be_immutable
class DashBoardScreen extends StatefulWidget {
  Widget child;
  DashBoardScreen(this.child, {super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool hover = false;
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchlistBloc, WatchlistState>(
      listener: (context, state) {
        if (state is WatchlistHoveringState) {
          hover = state.hover;
        }
      },
      builder: (context, state) {
        return BlocListener<WatchlistBloc, WatchlistState>(
          listener: (context, state) {
            if (state is WatchlistHoveringState) {
              hover = state.hover;
            }
          },
          child: _getNavigatatorRail(),
        );
      },
    );
  }

  Widget _getNavigatatorRail() {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is Disconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: backcolor,
        body: Stack(
          children: [
            Scaffold(
              body: Padding(
                key: SingletonScaffold().scaffoldKey,
                padding: const EdgeInsets.only(left: 70),
                child: widget.child,
              ),
              endDrawer: BlocConsumer<WatchlistBloc, WatchlistState>(
                listener: (context, state) {
                  if (state is WatchlistToggledState) {
                    isToggled = state.isToggled;
                  }
                },
                builder: (context, state) {
                  return Drawer(
                    width: 468,
                    clipBehavior: Clip.none,
                    child: GestureDetector(
                      onTap: () {},
                      child: OverlayScreen(
                        isToggled: isToggled,
                      ),
                    ),
                  );
                },
              ),
            ),
            MouseRegion(
              onHover: (event) {
                BlocProvider.of<WatchlistBloc>(context)
                    .add(WatchListItemHovering(
                  true,
                ));
              },
              onExit: (event) {
                BlocProvider.of<WatchlistBloc>(context)
                    .add(WatchListItemHovering(
                  false,
                ));
              },
              child: SizedBox(
                width: hover == true ? 200 : 70,
                child: NavigationRail(
                  backgroundColor: deeppurple,
                  extended: hover,
                  minExtendedWidth: 200,
                  indicatorColor: white30,
                  useIndicator: true,
                  destinations: [
                    navRailDesitination(walletloc, watchlist),
                    navRailDesitination(orderloc, orders),
                    navRailDesitination(walletloc, wallet),
                    navRailDesitination(logoutloc, logout),
                  ],
                  selectedIndex: _calculateSelectedIndex(context),
                  onDestinationSelected: (int index) =>
                      _onItemTapped(index, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/$watchlist')) {
      return 0;
    }
    if (location.startsWith('/$orders')) {
      return 1;
    }
    if (location.startsWith('/$wallet')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/$watchlist');
        break;
      case 1:
        GoRouter.of(context).go('/$orders');
        break;
      case 2:
        GoRouter.of(context).go('/$wallet');
        break;
      case 3:
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => const LogoutWidget());
        break;
      // case 3:
      //   if (SingletonScaffold().isEndrawerOpen) {
      //     Navigator.pop(context);
      //   }
      // showDialog<String>(
      //     context: context,
      //     builder: (BuildContext context) => const LogoutWidget());
      // break;
    }
  }

  NavigationRailDestination navRailDesitination(
      String assetPath, String labelName) {
    return NavigationRailDestination(
      icon: assetPath.toLowerCase().contains(".svg")
          ? SvgPicture.asset(
              assetPath,
              color: whitecolor,
              width: twenty,
              height: twenty,
            )
          : Image.asset(
              assetPath,
              color: whitecolor,
              width: twenty,
              height: twenty,
            ),
      label: Text(
        labelName,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
