import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Network Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.network(
              news.imageUrl.isNotEmpty
                  ? news.imageUrl
                  : 'https://via.placeholder.com/400x200?text=No+Image',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Image not available',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  news.title.isNotEmpty ? news.title : "No Title Available",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 8),

                // Description
                Text(
                  news.description.isNotEmpty
                      ? news.description
                      : "No Description Available",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 12),

                // Author and Date
                Text(
                  news.author.isNotEmpty ? news.author : "Unknown Author",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  news.date.isNotEmpty ? _formatDate(news.date) : "Unknown Date",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),

                SizedBox(height: 12),

                // Content Preview
                Text(
                  news.content.isNotEmpty
                      ? news.content
                      : "No Content Available",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[800],
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
