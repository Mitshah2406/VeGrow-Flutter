class Farmer {
  bool? exist;
  String? token;
  String? role;
  String? farmer;
  String? fName;
  String? lName;
  String? email;
  String? phone;

  Farmer(
      {this.exist,
      this.token,
      this.role,
      this.farmer,
      this.fName,
      this.lName,
      this.email,
      this.phone});

  Farmer.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    token = json['token'];
    role = json['role'];
    farmer = json['farmer'];
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
    data['farmer'] = this.farmer;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
