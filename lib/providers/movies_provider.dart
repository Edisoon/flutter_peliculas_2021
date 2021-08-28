import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_2021/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '55c194afc8bb27fedd779bb9013712ed';
  String _languaje = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRateMovies = [];
  List<Movie> uncomingMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage  = 0;
  int __topRatePage = 0;
  int _uncomingPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
    getTopRates();
    getUncoming();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async{
    var url = Uri.https(
      _baseUrl, endpoint,
        {'api_key': _apiKey, 
        'languaje': _languaje, 
        'page'    : '$page'}
      );

    final response = await http.get(url);
    return response.body;

  }

  getOnDisplayMovies() async {
    final jsonData =await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData =await _getJsonData('3/movie/popular', _popularPage);
    
    final popularResponse = PopularResponse.fromJson( jsonData );

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }


  getTopRates() async{
    __topRatePage++;
    final jsonData =await _getJsonData('3/movie/top_rated', __topRatePage);

    final topRateResponse = PopularResponse.fromJson(jsonData);

    topRateMovies = [...topRateMovies, ...topRateResponse.results];

    notifyListeners();
  }

  getUncoming() async{
    _uncomingPage++;
    final jsonData =await _getJsonData('3/movie/upcoming', _uncomingPage);

    final uncomingResponse = NowPlayingResponse.fromJson(jsonData);

    uncomingMovies = [...uncomingMovies, ...uncomingResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast( int movieId ) async{
    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    print('pidiendo info al server');

    final jsonData =await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;

  }


}
