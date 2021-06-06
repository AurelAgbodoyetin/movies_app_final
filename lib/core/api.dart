const String apiKey = "c3bb4121d423db6ff4dc38c3860bbf36";
const String urlApiKey = "?api_key=$apiKey";
const String baseUrl = "https://api.themoviedb.org/3/movie";
const String urlLanguage = "&language=fr";
const String urlUpComing = "/upcoming";

final String imageBase = 'https://image.tmdb.org/t/p/w92/';
final String defaultImage =
    'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

String makeSearchUrl(String searchKey) {
  return 'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$searchKey$urlLanguage';
}

String makeUpcomingUrl() {
  return baseUrl + urlUpComing + urlApiKey + urlLanguage;
}

String makeTrendingUrl() {
  return "https://api.themoviedb.org/3/trending/all/day$urlApiKey";
}
