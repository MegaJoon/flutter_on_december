// List<Sector>
class Sector {
  String backgroundImage;
  String image;
  String title;
  int score;
  String subTitle;

  Sector({this.backgroundImage, this.image, this.title, this.score, this.subTitle});
}

List<Sector> sector = [
  Sector(
      backgroundImage: "assets/1206/backgroundImage.jpg",
      image: "assets/1206/image.jpg",
      title: "Sector 1",
      score: 4,
      subTitle: "Sector1 sector1 sector1 sector1 sector1"),
  Sector(
      backgroundImage: "assets/1206/backgroundImage1.jpg",
      image: "assets/1206/image1.jpeg",
      title: "Sector 2",
      score: 4,
      subTitle: "Sector2 sector2 sector2 sector2 sector2"),
  Sector(
      backgroundImage: "assets/1206/backgroundImage2.gif",
      image: "assets/1206/image2.jpg",
      title: "Sector 3",
      score: 4,
      subTitle: "Sector3 sector3 sector3 sector3 sector3"),
  Sector(
      backgroundImage: "assets/1206/backgroundImage3.jpg",
      image: "assets/1206/image3.jpg",
      title: "Sector 4",
      score: 4,
      subTitle: "Sector4 sector4 sector4 sector4 sector4"),
  Sector(
      backgroundImage: "assets/1206/backgroundImage4.jfif",
      image: "assets/1206/image4.webp",
      title: "Sector 5",
      score: 4,
      subTitle: "Sector5 sector5 sector5 sector5 sector5"),
];