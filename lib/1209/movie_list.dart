class SubImage {
  String image;
  String image1;
  String image2;

  SubImage({this.image, this.image1, this.image2});
}

class MovieList {
  String image;
  List<SubImage> subImage;

  String title;
  String genre;

  MovieList({this.image, this.subImage, this.title, this.genre});
}

List<MovieList> movieList = [
  MovieList(
    image: "assets/1209/movie00.jpg",
    subImage: [
      SubImage(
        image: "assets/1209/movie01.jpg",
        image1: "assets/1209/movie02.jpeg",
        image2: "assets/1209/movie03.jfif",
      ),
    ],
    title: "Joker",
    genre: "Crime, Drama, Thriller",
  ),

  MovieList(
    image: "assets/1209/movie10.jpg",
    subImage: [
      SubImage(
        image: "assets/1209/movie11.jpg",
        image1: "assets/1209/movie12.jpg",
        image2: "assets/1209/movie13.jfif",
      ),
    ],
    title: "John Wick",
    genre: "Crime, Drama, Thriller",
  ),

  MovieList(
    image: "assets/1209/movie20.jpg",
    subImage: [
      SubImage(
        image: "assets/1209/movie20.jpg",
        image1: "assets/1209/movie20.jpg",
        image2: "assets/1209/movie20.jpg",
      ),
    ],
    title: "Ad astra",
    genre: "-, -, -",
  ),

  MovieList(
    image: "assets/1209/movie30.jpg",
    subImage: [
      SubImage(
        image: "assets/1209/movie30.jpg",
        image1: "assets/1209/movie30.jpg",
        image2: "assets/1209/movie30.jpg",
      ),
    ],
    title: "날씨의 아이",
    genre: "-, -, -",
  ),
];
