import 'package:bloc/src/models/item_model.dart';
import 'package:bloc/src/resources/movie_api_provider.dart';
import 'dart:async';

class Repository {
  final movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchallMovies() => movieApiProvider.fetchMovieList();
}
