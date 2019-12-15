class ShoesList {
  String image;
  String title;
  String subTitle;
  String price;

  ShoesList({this.image, this.title, this.subTitle, this.price});
}

List<ShoesList> shoesList = [
  ShoesList(image: "assets/1214/image10.png", title: "NARPOWER SHOES", subTitle: "Allround Light C+", price: "\$59.99",),
  ShoesList(image: "assets/1214/image11.png", title: "ACTIVE LIGHT", subTitle: "Carbon Bar", price: "\$29.99",),
  ShoesList(image: "assets/1214/image12.png", title: "KIDS SHOES", subTitle: "Orange Junior", price: "\$47.99",),
];