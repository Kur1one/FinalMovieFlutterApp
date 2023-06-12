

import 'package:flutter/material.dart';
import 'package:movieapp/providers/favourite_list_provider.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/favourite_screen.dart';
import 'package:movieapp/widgets/search_screen.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movieapp/widgets/splash_screen.dart';
import 'package:movieapp/widgets/login_screen.dart';
import 'package:movieapp/widgets/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<MovieProvider>(
      create: (context) => MovieProvider(),
      child: MyApp(),
    ),
  );
}

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.red),
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => Home(),
          '/login': (context) => SignInScreen(),
          '/register': (context) => SignUpScreen(),
          '/search': (context) => SearchScreen(),
          '/favourites': (context) => FavoritesScreen(),
        },
      );
    }
  }
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '746896ecf94e873903aa47e53113a615';
  final readaccestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY4OTZlY2Y5NGU4NzM5MDNhYTQ3ZTUzMTEzYTYxNSIsInN1YiI6IjY0NDk0MjI1NDk3NTYwMDRlNmRmNWI3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CDCe7B5Z8Tm9fJ_iFBrxgkKq9GarPiNQXbgd4jQq07s';
  bool isDarkTheme = true;

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // Add other theme properties as needed
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    // Add other theme properties as needed
  );

  @override
    void initState() {
      loadmovies();
      super.initState();
    }

    loadmovies() async {
      TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccestoken),
          logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true,
          ));
      Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
      Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
      Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
      setState(() {
        trendingmovies = trendingresult['results'];
        topratedmovies = topratedresult['results'];
        tv = tvresult['results'];
      });

      print(tv);
    }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

    @override
    Widget build(BuildContext context) {
      final ThemeData currentTheme = isDarkTheme ? darkTheme : lightTheme;
      return MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: currentTheme,
        home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          title: modified_text(text: 'IFilm'),),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
        onTap: (index)=>{
            if (index==0) {
              Navigator.pushNamed(context, '/home')
            }
            else if(index==2) {
              Navigator.pushNamed(context, '/search')
            }
        },),
        body: ListView(
          children: [
            TV(tv: tv,),
            TopRated(toprated: topratedmovies,),
            TrendingMovies(trending: trendingmovies)
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/favourites');
            }, child: Text('Go to Favourites')),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.login),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.person_add),
            ),
            FloatingActionButton(
              onPressed: toggleTheme,
              backgroundColor: Colors.white,
              child: Icon (Icons.color_lens))
          ],
        ),
      ),
      );
    }
}


