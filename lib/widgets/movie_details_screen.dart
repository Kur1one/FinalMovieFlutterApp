import 'dart:async';
import 'package:movieapp/description.dart';

import 'secrets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter/material.dart';


class MovieDetailsScreen extends StatelessWidget {
  final Map movie;

  MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    final name = movie['title'];
    final description = movie['overview'];
    final bannerUrl = 'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}';
    final posterUrl = 'https://image.tmdb.org/t/p/w200${movie['poster_path']}';
    final vote = movie['vote_average'].toString();
    final launchOn = movie['release_date'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Description(
        name: name,
        description: description,
        bannerurl: bannerUrl,
        posterurl: posterUrl,
        vote: vote,
        launch_on: launchOn,
      ),
    );
  }
}