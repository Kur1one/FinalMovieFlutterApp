import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/providers/favourite_list_provider.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/movie_details_screen.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on, required Movie movie}) : movie = movie,   super(key: key);
  final String name, description, bannerurl, posterurl, vote, launch_on;
  late final Movie movie;


  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    bool isFavourite = movieProvider.favourites.contains(movie);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            ElevatedButton(onPressed: () {
              if (isFavourite) {
                movieProvider.removeFromFavourites(movie);
              }
              else {
                movieProvider.addToFavourites(movie);
              }

            }, child: isFavourite ? Text('Remove from Favourites') : Text('Add to Favourites')),
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover,),
                  )),
                  Positioned(bottom: 10,
                      child: modified_text(text: ' ⭐ Average Rating - ' + vote, size: 17,))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(padding: EdgeInsets.all(10),
            child: modified_text(text: name!=null ? name :'Not Loaded', size: 24),),
          Container(padding: EdgeInsets.only(left: 10),
          child: modified_text(text: 'Releasing On - '+launch_on, size: 14,)
            ,),
      Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),

            height: 200,
          width: 100,
          child: Image.network(posterurl),),
          
          Flexible(
            child: Container(
              child: modified_text(text: description, size: 18,)
            ),
          )
        ],
      )],

        ),
      ),
    );
  }
}
