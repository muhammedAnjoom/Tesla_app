
class Category{
  final String? id, title,image;
  final int? numOfProducts;
  Category({
    this.id,
    this.title,
    this.image,
    this.numOfProducts
  });

  factory Category.fromJson(Map<String,dynamic> json){
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"]
    );
  }
}

// our demo category
// Category category = Category(
//   id: "1",
//   title: "Armachair",
//   image: "https://i.imgur.com/JqKDdxj.png",
//   numOfProucts: 100
// );