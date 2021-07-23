import 'package:flutter/material.dart';
import 'package:movies_bloc/src/utils/movie_test_constants.dart';

Widget buildWidget([Widget? widget]) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: MovieTestConstants.homePageTestTitle,
    home: widget,
  );
}
