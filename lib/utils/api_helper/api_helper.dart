import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imdb/home/model/home_model.dart';

class ApiHelper{
  Future<Imdb> apiHelper(String Movie) async {
    Uri uri = Uri.parse("https://imdb8.p.rapidapi.com/auto-complete?q=$Movie");
    var response = await http.get(uri,headers: {
      "X-RapidAPI-Key":"a0f85348a8mshb46c481e6ac5541p1cac20jsn984be2cd2605","X-RapidAPI-Host":"imdb8.p.rapidapi.com"
    });
    var json = jsonDecode(response.body);
    Imdb imdb = Imdb.fromJson(json);
    return imdb;
  }
}