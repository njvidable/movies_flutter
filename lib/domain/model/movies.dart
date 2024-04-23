class MovieModel {
    static const String _imageBaseURL = "https://image.tmdb.org/t/p/w500";
    final int id;
    final String title;
    final String description;
    final String imageURL;

    MovieModel({
        required this.id,
        required this.title,
        required this.description,
        required this.imageURL
    });

    String getFullURL() {
      return '$_imageBaseURL$imageURL';
    }
}
