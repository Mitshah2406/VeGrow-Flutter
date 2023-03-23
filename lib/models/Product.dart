// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.inventoryId,
    this.productName,
    this.productDescription,
    this.productListedDate,
    this.productExpiryDate,
    this.productImages,
    this.productUnit,
    this.productQuantity,
    this.initialBidPrice,
    this.productId,
    this.farmerId,
  });

  String? inventoryId;
  String? productName;
  String? productDescription;
  DateTime? productListedDate;
  DateTime? productExpiryDate;
  String? productImages;
  String? productUnit;
  String? productQuantity;
  String? initialBidPrice;
  int? productId;
  String? farmerId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        inventoryId: json["inventoryId"],
        productName: json["productName"],
        productDescription: json["productDescription"],
        productListedDate: json["productListedDate"] == null
            ? null
            : DateTime.parse(json["productListedDate"]),
        productExpiryDate: json["productExpiryDate"] == null
            ? null
            : DateTime.parse(json["productExpiryDate"]),
        productImages: json["productImages"],
        productUnit: json["productUnit"],
        productQuantity: json["productQuantity"],
        initialBidPrice: json["initialBidPrice"],
        productId: json["productId"],
        farmerId: json["farmerId"],
      );

  Map<String, dynamic> toJson() => {
        "inventoryId": inventoryId,
        "productName": productName,
        "productDescription": productDescription,
        "productListedDate":
            "${productListedDate!.year.toString().padLeft(4, '0')}-${productListedDate!.month.toString().padLeft(2, '0')}-${productListedDate!.day.toString().padLeft(2, '0')}",
        "productExpiryDate":
            "${productExpiryDate!.year.toString().padLeft(4, '0')}-${productExpiryDate!.month.toString().padLeft(2, '0')}-${productExpiryDate!.day.toString().padLeft(2, '0')}",
        "productImages": productImages,
        "productUnit": productUnit,
        "productQuantity": productQuantity,
        "initialBidPrice": initialBidPrice,
        "productId": productId,
        "farmerId": farmerId,
      };
}
