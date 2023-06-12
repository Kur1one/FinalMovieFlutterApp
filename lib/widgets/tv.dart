import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';

import '../utils/text.dart';

class TV extends StatelessWidget {
  final List? tv;
  const TV({Key? key, this.tv}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modified_text(text: 'Popular TV Shows', size: 26,),
            SizedBox(height: 10,),
            Container(height: 200,
                child: ListView.builder(itemCount: tv?.length, scrollDirection: Axis.horizontal ,itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: tv?[index]['original_name'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+tv?[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+tv?[index]['poster_path'],
                        description: tv?[index]['overview'],
                        vote: tv![index]['vote_average'].toString(),
                        launch_on: tv?[index]['release_date'],)));

                    },
                    child: tv?[index]['original_name']!=null?Container(
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
                                    'https://image.tmdb.org/t/p/w500' + tv?[index]['backdrop_path']
                                ), fit: BoxFit.cover
                            )),
                          ),
                          SizedBox(height: 10,),
                          Container(child: modified_text(text: tv?[index]['original_name'] != null?
                          tv![index]['original_name']:'Loading' ),)
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
