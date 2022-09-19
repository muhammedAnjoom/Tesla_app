
class Category{
  final String? id, title,image;
  final int? numOfProucts;
  Category({
    this.id,
    this.title,
    this.image,
    this.numOfProucts
  });

  factory Category.fromJson(Map<String,dynamic> json){
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProucts: json["numOfProucts"]
    );
  }
}

// our demo category
Category category = Category(
  id: "1",
  title: "Armachair",
  image: "assets/image/olena-sergienko-_ITQJtPxkJk-unsplash.jpg",
  numOfProucts: 100
);