class ProductModel {

  late final int id;
  late final String title;
  late final double price;
  late final String description;
  late final String category;
  late final String image;
  late final Rating rating;
  
  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = Rating.fromJson(json['rating']);
  }

}

class Rating {

  late final double rate;
  late final int count;
  
  Rating.fromJson(Map<String, dynamic> json){
    rate = json['rate'];
    count = json['count'];
  }
}