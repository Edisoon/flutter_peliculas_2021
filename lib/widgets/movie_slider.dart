import 'package:flutter/material.dart';
import 'package:peliculas_2021/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
   const MovieSlider({
     Key? key,
      required this.title, 
      required this.movies}) :assert(title!=''), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(this.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(this.title!,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff394867)),
              ),
            ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) => _MoviePoster(movies[index])),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'details', arguments: 'movie-instace'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
               image: NetworkImage(movie.fullPosterImg),
               width: 130,
               height: 190,
               fit: BoxFit.cover,
               ),
            ),
          ),
           SizedBox(height: 5),

           Text(
             movie.title,
             style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
           )

        ],
      ),
    );
  }
}
