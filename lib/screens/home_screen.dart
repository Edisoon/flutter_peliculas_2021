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
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          MovieSlider(
            title: 'Populares',
           movies: moviesProvider.popularMovies,//opcional
           ),
          // MovieSlider(seccion: 'Mas Votadas',),
          // MovieSlider(seccion: 'Recien Agregadas',),
          // MovieSlider(seccion: 'Series',),
          SizedBox(height: 10,)
        ],
      ),
      )
    );
  }
}