import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_evaluation/bloc/bloc/internet/bloc/internet_bloc.dart';
import 'package:web_evaluation/bloc/bloc/login/login_bloc.dart';
import 'package:web_evaluation/bloc/bloc/watchlist/watchlist_bloc.dart';
import 'package:web_evaluation/routes/routes.dart';

import 'screens/dashboard/watchlist_screen.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginBloc(),
          child: const LoginScreen(),
        ),
        BlocProvider(
          create: (BuildContext context) => WatchlistBloc(),
          child: const WatchListScreen(),
        ),
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Routers().router,
        title: 'SBI Web App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
