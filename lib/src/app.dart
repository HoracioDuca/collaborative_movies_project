import 'package:flutter/material.dart';
import 'blocs/movies_bloc.dart';
import 'ui/home_page.dart';

class MoviesApp extends StatelessWidget {
  final MoviesBloc _moviesBloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomePage(
          title: 'sdfsdfhsdf',
          moviesBloc: _moviesBloc,
        ),
      ),
    );
  }
}
