import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> favourites = [];

  void addToFavourites(Movie movie) {
    favourites.add(movie);
    notifyListeners();
  }

  void removeFromFavourites(Movie movie) {
    favourites.remove(movie);
    notifyListeners();
  }
}