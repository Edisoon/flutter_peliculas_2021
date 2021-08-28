import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_2021/models/models.dart';
import 'package:peliculas_2021/widgets/widgets.dart';

class CardSwiper extends StatelessWidget {
  final String? title;
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies, this.title}):
   assert(title!=''),
   super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    if(this.movies.length==0){
      return LoadingCircular();
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(this.title != null)
            Padding(
              padding: EdgeInsetsDirectional.only(start: 15, top: 10),
              child: Text(this.title!,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff14274E)),
              ),
            ),
          Swiper(
            // autoplay: true,
            // autoplayDelay: 5000,
            autoplayDisableOnInteraction: true,
            itemCount: movies.length,
            layout: SwiperLayout.TINDER,
            itemWidth: size.width * 0.70,
            itemHeight: size.width * 0.90,
            itemBuilder: (_, int index) {

              final movie = movies[index];

              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments: movie),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterImg),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
