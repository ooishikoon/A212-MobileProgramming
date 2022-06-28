class Cart {
  String? cartId;
  String? subjectName;
  String? subjectQty;
  String? price;
  String? cartQty;
  String? subjectId;
  String? priceTotal;

  Cart(
      {this.cartId,
      this.subjectName,
      this.subjectQty,
      this.price,
      this.cartQty,
      this.subjectId,
      this.priceTotal});

  Cart.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    subjectName = json['subjectName'];
    subjectQty = json['subjectQty'];
    price = json['price'];
    cartQty = json['cartQty'];
    subjectId = json['subjectId'];
    priceTotal = json['priceTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartId'] = cartId;
    data['subjectName'] = subjectName;
    data['subjectQty'] = subjectQty;
    data['price'] = price;
    data['cartQty'] = cartQty;
    data['subjectId'] = subjectId;
    data['priceTotal'] = priceTotal;
    return data;
  }
}