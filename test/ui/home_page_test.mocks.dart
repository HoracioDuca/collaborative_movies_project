// Mocks generated by Mockito 5.0.11 from annotations
// in movies_bloc/test/home_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movies_bloc/src/models/movie.dart' as _i3;
import 'package:movies_bloc/src/resources/movie_api_provider.dart' as _i2;
import 'package:movies_bloc/src/resources/movie_repository.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMovieApiProvider extends _i1.Fake implements _i2.MovieApiProvider {}

class _FakeMovie extends _i1.Fake implements _i3.Movie {}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i4.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieApiProvider get moviesApiProvider =>
      (super.noSuchMethod(Invocation.getter(#moviesApiProvider),
          returnValue: _FakeMovieApiProvider()) as _i2.MovieApiProvider);
  @override
  _i5.Future<_i3.Movie> fetchAllMovies() =>
      (super.noSuchMethod(Invocation.method(#fetchAllMovies, []),
              returnValue: Future<_i3.Movie>.value(_FakeMovie()))
          as _i5.Future<_i3.Movie>);
  @override
  _i5.Future<_i3.Movie> fetchMoviesByFilter(String? query) =>
      (super.noSuchMethod(Invocation.method(#fetchMoviesByFilter, [query]),
              returnValue: Future<_i3.Movie>.value(_FakeMovie()))
          as _i5.Future<_i3.Movie>);
}