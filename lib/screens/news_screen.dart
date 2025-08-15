import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/cubit/news_cubit.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  @override
  State<NewsScreen> createState() => NewsscreenState();
}

class NewsscreenState extends State<NewsScreen> {
  TextEditingController searchText = TextEditingController();
  final GlobalKey<FormFieldState> _searchFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: _searchFieldKey,
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: 'Search something',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 18),
                ),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter a search term' : null,
                controller: searchText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_searchFieldKey.currentState != null) {
                    if (_searchFieldKey.currentState!.validate()) {
                      context.read<NewsCubit>().fetchNews(searchText.text);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Get News'),
              ),
            ),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(news: state.news[index]);
                      },
                    ),
                  );
                } else if (state is NewsError) {
                  return Center(child: Text(state.message));
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
