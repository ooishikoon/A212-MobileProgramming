class User {
  String? id;
  String? name;
  String? phoneno;
  String? address;
  String? email;

  User({this.id, this.name, this.phoneno, this.address, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneno = json['phoneno'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['phoneno'] = phoneno;
    data['email'] = email;
    return data;
  }
}