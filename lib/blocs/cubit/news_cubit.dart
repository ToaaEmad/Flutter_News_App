import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  final dio = Dio();

  Future<List<NewsModel>> getHttp({required String searchText}) async {
    final response = await dio.get(
      "https://newsapi.org/v2/everything?q=$searchText&from=2025-08-07&sortBy=publishedAt&apiKey=06f62b3dc88f4d5aa5257abef0bd2340",
    );
    final articles = response.data['articles'] as List;
    if (articles.isEmpty) {
      throw Exception("No news articles found");
    }
    return articles.map((article) => NewsModel.fromJson(article)).toList();
  }

  void fetchNews(String searchText) async {
    emit(NewsLoading());
    try {
      List<NewsModel> fetchedNews = await getHttp(searchText: searchText);
      emit(NewsLoaded(fetchedNews));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

}
