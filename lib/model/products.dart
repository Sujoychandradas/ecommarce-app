// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product {
//   final String brand;
//   final String category;
//   final String description;
//   final double discountPercentage;
//   final int id;
//   final List images ;
//   final int price;
//   final double rating;
//   final int stock;
//   final String thumbnail;
//   final String title;

//   const Product(
//       {required this.brand,
//       required this.category,
//       required this.description,
//       required this.discountPercentage,
//       required this.id,
//       required this.images,
//       required this.price,
//       required this.rating,
//       required this.stock,
//       required this.thumbnail,
//       required this.title});

//   factory Product.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> snapshot) {
//     final data = snapshot.data()!;
//     return Product(
//         brand: data['brand'],
//         category: data['category'],
//         description: data['description'],
//         discountPercentage: data['discountPercentage'],
//         id: data['id'],
//         images: data['images'],
//         price: data['price'],
//         rating: data['rating'].toDouble(),
//         stock: data['stock'],
//         thumbnail: data['thumbnail'],
//         title: data['title']);
//   }
// }
class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({this.title, this.price, this.description, this.image, this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}

List<Product> products = [
  Product(
      title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      price: 109.95,
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      rating: Rating(rate: 3.9, count: 120)),
  Product(
      title: "Mens Casual Premium Slim Fit T-Shirts ",
      price: 22.3,
      description:
          "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      image:
          "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      rating: Rating(rate: 4.1, count: 259)),
  Product(
      title: "iPhone X",
      price: 899,
      description:
          "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
      image: "https://i.dummyjson.com/data/products/2/1.jpg",
      rating: Rating(rate: 4.44, count: 120)),
  Product(
      title: "Samsung Universe 9 ",
      price: 1249,
      description:
          "Samsung's new variant which goes beyond Galaxy to the Universe",
      image: "https://i.dummyjson.com/data/products/3/1.jpg",
      rating: Rating(rate: 4.1, count: 259)),
  Product(
      title: "OPPOF19 ",
      price: 280,
      description: "OPPO F19 is officially announced on April 2021.",
      image: "https://i.dummyjson.com/data/products/4/thumbnail.jpg",
      rating: Rating(rate: 4.1, count: 259)),
];
