// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        required this.productName,
        required this.productDescription,
        required this.productImages,
        required this.productQuantity,
        required this.productUnit,
        required this.productExpiryDate,
        required this.productListedDate,
    });

    String productName;
    String productDescription;
    List<dynamic> productImages;
    int productQuantity;
    String productUnit;
    DateTime productExpiryDate;
    DateTime productListedDate;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["productName"],
        productDescription: json["productDescription"],
        productImages: List<dynamic>.from(json["productImages"].map((x) => x)),
        productQuantity: json["productQuantity"],
        productUnit: json["productUnit"],
        productExpiryDate: DateTime.parse(json["productExpiryDate"]),
        productListedDate: DateTime.parse(json["productListedDate"]),
    );

    Map<String, dynamic> toJson() => {
        "productName": productName,
        "productDescription": productDescription,
        "productImages": List<dynamic>.from(productImages.map((x) => x)),
        "productQuantity": productQuantity,
        "productUnit": productUnit,
        "productExpiryDate": "${productExpiryDate.year.toString().padLeft(4, '0')}-${productExpiryDate.month.toString().padLeft(2, '0')}-${productExpiryDate.day.toString().padLeft(2, '0')}",
        "productListedDate": productListedDate.toIso8601String(),
    };
}
