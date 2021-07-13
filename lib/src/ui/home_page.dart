import 'package:flutter/material.dart';
import '../widgets/movie_appbar_flexible_space_style.dart';
import '../widgets/movie_search_bar.dart';
import '../widgets/movies_grid_view.dart';
import '../utils/movie_strings.dart';
import '../utils/movie_dimensions.dart';
import '../blocs/i_movies_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;

  final IMoviesBloc moviesBloc;

  HomePage({
    required this.moviesBloc,
    required this.title,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    widget.moviesBloc.fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: !isSearching
            ? Text(
                widget.title,
              )
            : MovieSearchBar(
                moviesBloc: widget.moviesBloc,
              ),
        leading: Image.asset(
          MovieStrings.imageLogo,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
            ),
            onPressed: () {},
          ),
          isSearching
              ? IconButton(
                  icon: Icon(
                    Icons.cancel,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        this.isSearching = false;
                        widget.moviesBloc.fetchAllMovies();
                      },
                    );
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        this.isSearching = true;
                      },
                    );
                  },
                ),
        ],
        flexibleSpace: MovieAppBarFlexibleSpaceStyle(
          futureChild: null,
        ),
        elevation: MovieDimensions.shadowAppBar,
      ),
      body: MovieGridView(
        allMovies: widget.moviesBloc.streamMovies,
      ),
    );
  }
}
