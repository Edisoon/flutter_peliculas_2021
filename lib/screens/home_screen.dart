import 'package:flutter/material.dart';
import 'package:peliculas_2021/providers/movies_provider.dart';
import 'package:peliculas_2021/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final moviesProvider = Provider.of<MoviesProvider>(context);
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          CardSwiper(title:'En Reproduccion', movies: moviesProvider.onDisplayMovies),

          
          MovieSlider(title: 'Populares', movies: moviesProvider.popularMovies,
          onNextPage: ()=> moviesProvider.getPopularMovies(),),
          SizedBox(height: 5),

          MovieSlider(title: 'Mejor Valoradas', movies: moviesProvider.topRateMovies, 
          onNextPage: ()=> moviesProvider.getTopRates()),
          SizedBox(height: 5),

          MovieSlider(title: 'Proximamente', movies: moviesProvider.uncomingMovies,
          onNextPage: ()=> moviesProvider.getUncoming()),
          // MovieSlider(seccion: 'Recien Agregadas',),
          // MovieSlider(seccion: 'Series',),
          SizedBox(height: 10,)
        ],
      ),
      )
    );
  }
}