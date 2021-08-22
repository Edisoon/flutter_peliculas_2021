import 'package:flutter/material.dart';
import 'package:peliculas_2021/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Cambiar luegopor una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCards()
          ])),
        ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xff14274E),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsetsDirectional.only(bottom: 10),
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x400'),
          fit: BoxFit.cover,
          ),
        ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextTheme texTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('movie.title', style: texTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
            Text('originalTitle', style: texTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1,),

            Row(
              children: [
                Icon(Icons.star_outline,size: 15, color: Colors.grey,),
                SizedBox(width: 5,),
                Text('movie.voteAverage', style: texTheme.caption)
              ],
            )
          ],)
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextTheme texTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Text('Nulla dolore et nisi cillum sit duis minim consectetur commodo minim quis aliquip commodo duis. Adipisicing fugiat velit consequat cillum ullamco pariatur consequat elit duis sunt. Do est veniam nulla nisi irure in cupidatat ullamco laboris elit est est commodo Lorem. Aliquip proident dolore fugiat deserunt laboris laboris incididunt proident cupidatat magna nostrud consectetur.',
      textAlign: TextAlign.justify,
      style: texTheme.subtitle1,
      ),
    );
  }
}