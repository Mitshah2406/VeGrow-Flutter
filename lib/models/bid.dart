// To parse this JSON data, do
//
//     final bid = bidFromJson(jsonString);

import 'dart:convert';

List<Bid> bidFromJson(String str) => List<Bid>.from(json.decode(str).map((x) => Bid.fromJson(x)));

String bidToJson(List<Bid> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bid {
    Bid({
        this.bidId,
        this.bidQuantity,
        this.bidAmount,
        this.bidStatus,
        this.dateTime,
        this.vendorName,
        this.inventoryId,
        this.vendorId,
    });

    String? bidId;
    String? bidQuantity;
    String? bidAmount;
    String? bidStatus;
    DateTime? dateTime;
    String? vendorName;
    String? inventoryId;
    String? vendorId;

    factory Bid.fromJson(Map<String, dynamic> json) => Bid(
        bidId: json["bidId"],
        bidQuantity: json["bidQuantity"],
        bidAmount: json["bidAmount"],
        bidStatus: json["bidStatus"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        vendorName: json["vendorName"],
        inventoryId: json["inventoryId"],
        vendorId: json["vendorId"],
    );

    Map<String, dynamic> toJson() => {
        "bidId": bidId,
        "bidQuantity": bidQuantity,
        "bidAmount": bidAmount,
        "bidStatus": bidStatus,
        "dateTime": dateTime?.toIso8601String(),
        "vendorName": vendorName,
        "inventoryId": inventoryId,
        "vendorId": vendorId,
    };
}
