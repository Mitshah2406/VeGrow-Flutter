class Vendor {
  bool? exist;
  String? token;
  String? role;
  String? vendor;
  String? fName;
  String? lName;
  String? email;
  String? phone;

  Vendor(
      {this.exist,
      this.token,
      this.role,
      this.vendor,
      this.fName,
      this.lName,
      this.email,
      this.phone});

  Vendor.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    token = json['token'];
    role = json['role'];
    vendor = json['vendor'];
    fName = json['fName'];
    lName = json['lName'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exist'] = this.exist;
    data['token'] = this.token;
    data['role'] = this.role;
    data['vendor'] = this.vendor;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
