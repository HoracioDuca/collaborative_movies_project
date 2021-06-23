import 'package:flutter/material.dart';
import '../utils/movie_strings.dart';
import '../utils/movie_dimensions.dart';
import '../models/movie.dart';
import '../blocs/i_movies_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;

  final IMoviesBloc iMoviesBloc;

  HomePage({
    required this.iMoviesBloc,
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
    widget.iMoviesBloc.fetchMoviesApi();
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
            : TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: MovieStrings.hintText,
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onSubmitted: (
                  filterKeys,
                ) {
                  widget.iMoviesBloc.fetchMoviesFilter(
                    filterKeys,
                  );
                },
              ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {},
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.black,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        elevation: MovieDimensions.shadowAppBar,
      ),
      body: StreamBuilder(
        stream: widget.iMoviesBloc.streamMovies,
        builder: (
          context,
          AsyncSnapshot<Movie> snapshot,
        ) {
          return snapshot.hasData
              ? buildList(
                  snapshot,
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    color: Colors.black,
                  ),
                );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot snapshot) {
    return snapshot.hasData
        ? GridView.builder(
            itemCount: snapshot.data.results.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: MovieDimensions.mainAxisExtent,
              crossAxisCount: MovieDimensions.gridColumns,
            ),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return GridTile(
                child: Container(
                  margin: EdgeInsets.all(
                    MovieDimensions.gridTileMargin,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          MovieDimensions.boxShadowOpacity,
                        ),
                        spreadRadius: MovieDimensions.boxShadowSpreadRadius,
                        blurRadius: MovieDimensions.boxShadowBlurRadius,
                      ),
                    ],
                  ),
                  child: Image.network(
                    snapshot.data.results[index].posterPath,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          )
        : Container();
  }
}
