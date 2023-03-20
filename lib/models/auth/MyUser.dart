class MyUser {
  bool? exist;
  String? token;
  String? role;
  String? id;
  String? fName;
  String? lName;
  String? email;
  String? phone;

  MyUser(
      {this.exist,
      this.token,
      this.role,
      this.id,
      this.fName,
      this.lName,
      this.email,
      this.phone});

  MyUser.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    token = json['token'];
    role = json['role'];
    id = json['id'];
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
    data['id'] = this.id;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
