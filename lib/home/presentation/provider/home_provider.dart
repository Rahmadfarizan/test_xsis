import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_xsis/home/sevice/home_service.dart';

import '../../model/movies_model.dart';

class HomeProvider extends ChangeNotifier {
  final _apiService = HomeServiceAPI();
  final List<Movie> _movie = [];
  List<Movie> get listMovie => _movie;

  final List<Movie> _lastestMovie = [];
  List<Movie> get lastestMovie => _lastestMovie;

   final List<Movie> _actionMovie = [];
  List<Movie> get actionMovie => _actionMovie;
  loadMovie(String title) async {
    try {
      _movie.clear();
      notifyListeners();
      log("LOAD MOVIE START");
      final responseData = await _apiService.getFilm(title);
      if (responseData['Search'] != null) {
        log("MOVIE => ${responseData['Search'].length}");
        for (int i = 0; i < responseData['Search'].length; i++) {
          _movie.add(Movie.fromJson(responseData['Search'][i]));
        }
      }
      log("LOAD MOVIE => $_movie");
      notifyListeners();
      return _movie;
    } catch (e) {
      return e;
    }
  }

   loadLastestMovie(String title) async {
    try {
      _lastestMovie.clear();
      notifyListeners();
      log("LOAD MOVIE START");
      final responseData = await _apiService.getFilm(title);
      if (responseData['Search'] != null) {
        log("MOVIE => ${responseData['Search'].length}");
        for (int i = 0; i < responseData['Search'].length; i++) {
          _lastestMovie.add(Movie.fromJson(responseData['Search'][i]));
        }
      }
      log("LOAD MOVIE => $_lastestMovie");
      notifyListeners();
      return _lastestMovie;
    } catch (e) {
      return e;
    }
  }

     loadActionMovie(String title) async {
    try {
      _actionMovie.clear();
      notifyListeners();
      log("LOAD MOVIE START");
      final responseData = await _apiService.getFilm(title);
      if (responseData['Search'] != null) {
        log("MOVIE => ${responseData['Search'].length}");
        for (int i = 0; i < responseData['Search'].length; i++) {
          _actionMovie.add(Movie.fromJson(responseData['Search'][i]));
        }
      }
      log("LOAD MOVIE => $_actionMovie");
      notifyListeners();
      return _actionMovie;
    } catch (e) {
      return e;
    }
  }
}
