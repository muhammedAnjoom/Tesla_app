
class  Product {
    final int? price;
    final String? id,title,category,image, subTitle,description;
    Product({
      this.id,
      this.price,
      this.title,
      this.image,
      this.category,
      this.description,
      this.subTitle
    });

    factory Product.fromJson(Map<String,dynamic> json){
      return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        image: json['image'],
        description: json['description'],
        category: json['category'],
        subTitle: json['subTitle'],
      );

    }
    
}
Product product = Product(
  id: '1',
  price: 10000,
  title: "wood Frame",
  category: "Chair",
  subTitle: "Tieton Armchair",
  image: "https://i.imgur.com/sI4GvE6.png",
  description: description,
);
String description ="A chair is a type of seat, typically designed for one person and consisting of one or more legs, a flat seat and a back-rest. ";