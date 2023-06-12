import 'dart:async';
import 'secrets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb_api/tmdb_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);


  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search movies',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            _searchMovies(value);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResult.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchResult[index]['title']),
          );
        },
      ),
    );
  }

  void _searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResult = [];
      });
      return;
    }
    final String apikey = '746896ecf94e873903aa47e53113a615';
    final readaccestoken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY4OTZlY2Y5NGU4NzM5MDNhYTQ3ZTUzMTEzYTYxNSIsInN1YiI6IjY0NDk0MjI1NDk3NTYwMDRlNmRmNWI3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CDCe7B5Z8Tm9fJ_iFBrxgkKq9GarPiNQXbgd4jQq07s';

    // Perform the search using the TMDB API
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccestoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map searchResult = await tmdbWithCustomLogs.v3.search.queryMovies(query);

    setState(() {
      _searchResult = searchResult['results'];
    });
  }
}
