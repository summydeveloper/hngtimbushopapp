# HNG Timbu Shop App

This is a Flutter-based mobile application that allows users to browse and view products fetched from the Timbu API. This README provides an overview of the app, instructions for setup, and guidelines for contributing.

## Getting Started
Features
Product List: Display a list of products fetched from the Timbu API.
Product Details: View detailed information for each product.
Responsive Design: Optimized for both Android and iOS platforms.
State Management: Utilizes Riverpod for efficient state management.

# Installation
 Prerequisites
Flutter SDK: Install Flutter
IDE (e.g., Android Studio, VS Code)

- Clone the repository
  git clone https://github.com/yourusername/timbu_app.git
  cd hngtimbushopapp
- Install Depencies
  flutter pub get
- Run the app
   flutter run

# API Usage
The app uses the Timbu API to fetch product data. Make sure to replace apiKey in apiservice.dart with your API key.
final String apiKey = 'your_api_key_here';
final String baseUrl = 'https://api.timbu.cloud';


