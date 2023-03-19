class Farmer {
	String? farmer;
	String? fName;
	String? lName;
	String? email;
	String? phone;
	Location? location;
	String? token;

	Farmer({this.farmer, this.fName, this.lName, this.email, this.phone, this.location, this.token});

	Farmer.fromJson(Map<String, dynamic> json) {
		farmer = json['farmer'];
		fName = json['fName'];
		lName = json['lName'];
		email = json['email'];
		phone = json['phone'];
		location = json['location'] != null ? new Location.fromJson(json['location']) : null;
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['farmer'] = this.farmer;
		data['fName'] = this.fName;
		data['lName'] = this.lName;
		data['email'] = this.email;
		data['phone'] = this.phone;
		if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
		data['token'] = this.token;
		return data;
	}
}

class Location {



	Location.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}