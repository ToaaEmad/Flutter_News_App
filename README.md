# 📰 Flutter News Application

A Flutter application that fetches and displays news articles using the NewsAPI. Built with clean architecture and BLoC state management.

## 🚀 Features

- 🔍 Search Functionality: Search for news articles by keywords
- ✅ Form Validation: Input validation with visual feedback (red borders, error messages)
- 🌐 Network Images: Display article images with loading and error states
- 🎨 Custom Cards: Simple readable news cards
- ⚡️ State Management: BLoC/Cubit pattern for efficient state management
- 🔄 HTTP Requests: Dio integration for robust API calls

## 📸 Screenshots

## 🏗 Architecture

This project follows Clean Architecture principles with the following structure:

<pre> ```text lib/ ├── blocs/ │ └── cubit/ │ └── news_cubit.dart # State management ├── models/ │ └── news_model.dart # Data models ├── screens/ │ └── newsScreen.dart # UI screens ├── widgets/ │ └── news_card.dart # Reusable widgets └── main.dart # App entry point ``` </pre>

## 📁 Project Structure Details

### Models (lib/models/)

- NewsModel: Data model for news articles with JSON serialization

### Widgets (lib/widgets/)

- NewsCard: Reusable card component displaying article information

### Screens (lib/screens/)

- NewsScreen: Main screen with search functionality and article list

### BLoC (lib/blocs/cubit/)

- NewsCubit: State management for news fetching and UI states

## 🛠 Technologies & Packages

- Flutter SDK ^3.7.2
- Dart ^3.7.2
- State Management: flutter_bloc: ^9.1.1, bloc: ^9.0.0
- HTTP Client: dio: ^5.9.0
- Icons: cupertino_icons: ^1.0.8

## 📋 Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK installed (version 3.7.2 or higher)
- Dart SDK installed (version 3.7.2 or higher)
- Android Studio or VS Code with Flutter extensions
- Git for version control
- NewsAPI Key (free from [newsapi.org](https://newsapi.org/))

## 🎯 Usage

1. Launch the app on your device/emulator
2. Enter search terms in the search field (minimum 2 characters)
3. Tap the search button to fetch news articles
4. Browse through news cards with images, titles, descriptions, and content
