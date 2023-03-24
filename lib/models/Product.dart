// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

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
    this.productQuantityLeftInInventory,
    this.status,
    this.farmerLocation,
    this.currentBidPrice,
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
  int? productQuantity;
  String? initialBidPrice;
  int? productQuantityLeftInInventory;
  String? status;
  FarmerLocation? farmerLocation;
  String? currentBidPrice;
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
        productQuantityLeftInInventory: json["productQuantityLeftInInventory"],
        status: json["status"],
        farmerLocation: json["farmerLocation"] == null
            ? null
            : FarmerLocation.fromJson(json["farmerLocation"]),
        currentBidPrice: json["currentBidPrice"],
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
        "productQuantityLeftInInventory": productQuantityLeftInInventory,
        "status": status,
        "farmerLocation": farmerLocation?.toJson(),
        "currentBidPrice": currentBidPrice,
        "productId": productId,
        "farmerId": farmerId,
      };
}

class FarmerLocation {
  FarmerLocation({
    this.lat,
    this.long,
    this.pinCode,
    this.locality,
    this.sublocality,
  });

  double? lat;
  double? long;
  String? pinCode;
  String? locality;
  String? sublocality;

  factory FarmerLocation.fromJson(Map<String, dynamic> json) => FarmerLocation(
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        pinCode: json["pinCode"],
        locality: json["locality"],
        sublocality: json["sublocality"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
        "pinCode": pinCode,
        "locality": locality,
        "sublocality": sublocality,
      };
}
