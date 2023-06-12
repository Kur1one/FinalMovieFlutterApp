
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favourite_list_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: movieProvider.favourites.length,
        itemBuilder: (context, index) {
          final movie = movieProvider.favourites[index];

          return ListTile(
            title: Text(movie.title),

            // Отображение других деталей фильма
          );
        },
      ),
    );
  }
}