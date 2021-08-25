import 'package:flutter/material.dart';
import 'package:peliculas_2021/models/models.dart';
import 'package:peliculas_2021/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie =
        ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie: movie),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(movie: movie),
            _Overview( movie: movie),
            _Overview(movie: movie),
            _Overview(movie: movie),
            CastingCards()
          ])),
        ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({required this.movie});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xff14274E),
      expandedHeight: 230,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsetsDirectional.only(bottom: 10, start: 8, end: 8),
          color: Colors.black12,
          child: Text(movie.title,
            style: TextStyle(fontSize: 16,),
            textAlign: TextAlign.center,
            ),
        ),
        background: Container(
          child: FadeInImage(
            placeholder: NetworkImage('https://via.placeholder.com/500x400'), 
            image: NetworkImage(movie.fullBackDropPath),
            fit: BoxFit.cover,
            ),
        ),
        ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {
    final Movie movie;

  const _PosterAndTitle({ required this.movie}) ;
  @override
  Widget build(BuildContext context) {
    final TextTheme texTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(movie.fullPosterImg),
              height: 160,
            ),
          ),
          SizedBox(width: 20,),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(movie.title, style: texTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text(movie.originalTitle, style: texTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2,),
          
              Row(
                children: [
                  Icon(Icons.star_outline,size: 15, color: Colors.grey,),
                  SizedBox(width: 5,),
                  Text('${movie.voteAverage}', style: texTheme.caption)
                ],
              )
            ],),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({ required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextTheme texTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style: texTheme.subtitle1,
      ),
    );
  }
}