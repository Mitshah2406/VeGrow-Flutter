// To parse this JSON data, do
//
//     final inventory = inventoryFromJson(jsonString);

import 'dart:convert';

List<Inventory> inventoryFromJson(String str) =>
    List<Inventory>.from(json.decode(str).map((x) => Inventory.fromJson(x)));

String inventoryToJson(List<Inventory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inventory {
  Inventory({
    this.id,
    this.productName,
    this.imgage,
    this.productMarketPrice,
  });

  int? id;
  String? productName;
  dynamic imgage;
  String? productMarketPrice;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"],
        productName: json["productName"],
        imgage: json["imgage"],
        productMarketPrice: json["productMarketPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "imgage": imgage,
        "productMarketPrice": productMarketPrice,
      };
}
