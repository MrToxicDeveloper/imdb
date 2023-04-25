import 'package:flutter/material.dart';
import 'package:imdb/home/model/home_model.dart';
import 'package:imdb/utils/api_helper/api_helper.dart';

class HomeProvider extends ChangeNotifier{

  ApiHelper apiHelper = ApiHelper();
  Imdb? imdb;

  Future<void> apiCalling(String Movie) async {
    imdb = await apiHelper.apiHelper(Movie);
    print("${imdb?.d![0]}");
    //return imdb;

    notifyListeners();
  }
}