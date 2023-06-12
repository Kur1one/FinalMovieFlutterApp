# Movie App

This mobile application is built using the Flutter framework and utilizes the TMDB (The Movie Database) API for retrieving movie data. The app also incorporates Firebase for user authentication, allowing users to log in and sign up. It provides features such as searching for movies, adding movies to favorites, and exploring movie categories.

## Features

The Movie App includes the following features:

1. **User Authentication**: Users can create an account and log in using Firebase authentication. This feature ensures secure access to personalized content.

2. **Movie Search**: Users can search for movies using keywords, and the app fetches relevant results from the TMDB API. The search functionality enables users to discover movies based on their preferences.

3. **Favorites Movies**: Once logged in, users can mark movies as favorites and save them for future reference. The app securely stores the user's favorite movies in the Firebase database.

4. **Movie Categories**: The app categorizes movies based on different genres or themes. Users can explore these categories to discover movies within their preferred genres.

## Installation

To run the Movie App locally, follow these steps:

1. Clone the repository: `git clone [https://github.com/your-username/movie-app.git](https://github.com/Kur1one/AITU-PROJECTS/tree/main)`
2. Change to the project directory: `cd movie-app`
3. Ensure you have Flutter installed. If not, follow the Flutter installation guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)
4. Connect a mobile device or emulator.
5. Run the app: `flutter run`

Note: Make sure to replace `your-username` with your actual GitHub username in the clone command.

## Configuration

Before running the app, you need to configure the following:

1. **TMDB API Key**: Obtain an API key from [TMDB](https://www.themoviedb.org/) by creating an account. Once you have the API key, open the project and navigate to `lib/utils/constants.dart`. Replace `YOUR_TMDB_API_KEY` with your actual TMDB API key.

2. **Firebase Configuration**: Create a Firebase project and configure Firebase authentication. Obtain the `google-services.json` file for Android or `GoogleService-Info.plist` for iOS from the Firebase console. Replace the existing file in the project's `android/app` or `ios/Runner` directory with your respective file.

3. **Dependencies**: Ensure that you have all the required dependencies mentioned in the `pubspec.yaml` file. Run `flutter pub get` to fetch the dependencies.

## Usage

Upon successfully running the Movie App, you can perform the following actions:

1. **User Authentication**: Log in or sign up using your Firebase account credentials. Once logged in, you can access personalized features like adding movies to favorites.

2. **Search Movies**: Use the search bar to enter keywords and find movies that match your search query. Browse through the search results to explore movie details.

3. **Favorites**: Mark movies as favorites by tapping the heart icon or any designated favorite button. The app will store your favorite movies, which can be accessed later.

4. **Movie Categories**: Explore different movie categories available in the app. Select a category to view movies belonging to that specific genre or theme.


## Acknowledgements

The Movie App makes use of the following open-source libraries and APIs:

- [Flutter](https://flutter.dev/)
- [TMDB API](https://www.themoviedb.org/)
- [Firebase](https://firebase.google.com/)

Special thanks to the Flutter and TMDB communities for their invaluable resources and support.
