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
        title: Text(
          widget.title,
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
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
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
                    color: Colors.lightGreenAccent,
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
                    MovieStrings.imagesPath +
                        snapshot.data!.results[index].posterPath,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          )
        : Container();
  }
}
