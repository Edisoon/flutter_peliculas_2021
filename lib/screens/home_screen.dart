import 'package:flutter/material.dart';
import 'package:peliculas_2021/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
          CardSwiper(),
          MovieSlider(seccion: 'Populares',),
          MovieSlider(seccion: 'Mas Votadas',),
          MovieSlider(seccion: 'Recien Agregadas',),
          MovieSlider(seccion: 'Series',),
          SizedBox(height: 10,)
        ],
      ),
      )
    );
  }
}