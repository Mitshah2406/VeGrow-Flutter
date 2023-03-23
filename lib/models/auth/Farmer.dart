// class Farmer {
//   bool? exist;
//   String? token;
//   String? role;
//   String? farmer;
//   String? fName;
//   String? lName;
//   String? location;
//   String? email;
//   String? phone;

//   Farmer(
//       {this.exist,
//       this.token,
//       this.role,
//       this.farmer,
//       this.fName,
//       this.lName,
//       this.location,
//       this.email,
//       this.phone});

//   Farmer.fromJson(Map<String, dynamic> json) {
//     exist = json['exist'];
//     token = json['token'];
//     role = json['role'];
//     farmer = json['farmer'];
//     fName = json['fName'];
//     lName = json['lName'];
//     location = json['location'];
//     email = json['email'];
//     phone = json['phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['exist'] = this.exist;
//     data['token'] = this.token;
//     data['role'] = this.role;
//     data['farmer'] = this.farmer;
//     data['fName'] = this.fName;
//     data['lName'] = this.lName;
//     data['location'] = this.location;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final farmer = farmerFromJson(jsonString);

import 'dart:convert';

List<Farmer> farmerFromJson(String str) => List<Farmer>.from(json.decode(str).map((x) => Farmer.fromJson(x)));

String farmerToJson(List<Farmer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Farmer {
    Farmer({
        required this.exist,
        required this.id,
        required this.farmer,
        required this.role,
        required this.token,
        required this.fName,
        required this.lName,
        required this.location,
        required this.phone,
        required this.email,
    });

    bool exist;
    String id;
    String farmer;
    String role;
    String token;
    String fName;
    String lName;
    Map location;
    String phone;
    String email;

    factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        exist: json["exist"],
        id: json["id"],
        farmer: json["farmer"],
        role: json["role"],
        token: json["token"],
        fName: json["fName"],
        lName: json["lName"],
        location: json['Location'],
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "exist": exist,
        "id": id,
        "farmer": farmer,
        "role": role,
        "token": token,
        "fName": fName,
        "lName": lName,
        "location": location,
        "phone": phone,
        "email": email,
    };
}

// class Location {
//     Location({
//         required this.lat,
//         required this.long,
//         required this.pinCode,
//         required this.locality,
//         required this.sublocality,
//     });

//     double lat;
//     double long;
//     String pinCode;
//     String locality;
//     String sublocality;

//     factory Location.fromJson(Map<String, dynamic> json) => Location(
//         lat: json["lat"]?.toDouble(),
//         long: json["long"]?.toDouble(),
//         pinCode: json["pinCode"],
//         locality: json["locality"],
//         sublocality: json["sublocality"],
//     );

//     Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "long": long,
//         "pinCode": pinCode,
//         "locality": locality,
//         "sublocality": sublocality,
//     };
// }
