import 'dart:convert';
import 'dart:async';
import 'package:bloc/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'ca0cbcb5178a95ef945e93b37885fd9f';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(
      Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      //parsing the data in the json forma
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
