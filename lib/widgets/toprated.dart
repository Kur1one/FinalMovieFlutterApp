import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';

import '../utils/text.dart';

class TopRated extends StatelessWidget {
  final List? toprated;
  const TopRated({Key? key, this.toprated}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modified_text(text: 'Top Rated', size: 26,),
            SizedBox(height: 10,),
            Container(height: 270,
                child: ListView.builder(itemCount: toprated?.length, scrollDirection: Axis.horizontal ,itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: toprated?[index]['title'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated?[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+toprated?[index]['poster_path'],
                        description: toprated?[index]['overview'],
                        vote: toprated![index]['vote_average'].toString(),
                        launch_on: toprated?[index]['release_date'],)));

                    },
                    child: toprated?[index]['title']!=null?Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' + toprated?[index]['backdrop_path']
                                ), fit: BoxFit.cover
                            )),
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: toprated?[index]['title'] != null?
                          toprated![index]['title']:'Loading' ),)
                        ],
                      ),
                    ):Container(),
                  );
                },))
          ],
        )
    );
  }
}
