import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/providers/favourite_list_provider.dart';
import 'package:movieapp/widgets/movie_details_screen.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favouriteListProvider =
    Provider.of<MovieProvider>(context, listen: false);
    final List<Movie> favourites = favouriteListProvider.favourites;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourites'),
      ),
      body: ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final Movie movie = favourites[index];

          return MovieDetailsScreen(movie: {},

            // Дополнительные детали фильма, которые ты хочешь отобразить
          );
        },
      ),
    );
  }
}
