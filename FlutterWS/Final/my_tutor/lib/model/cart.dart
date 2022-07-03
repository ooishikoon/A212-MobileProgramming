class Cart {
  String? cartid;
  String? subjectName;
  String? subjectQty;
  String? price;
  String? cartqty;
  String? subjectId;
  String? pricetotal;

  Cart(
      {this.cartid,
      this.subjectName,
      this.subjectQty,
      this.price,
      this.cartqty,
      this.subjectId,
      this.pricetotal});

  Cart.fromJson(Map<String, dynamic> json) {
    cartid = json['cartid'];
    subjectName = json['subjectName'];
    subjectQty = json['subjectQty'];
    price = json['price'];
    cartqty = json['cartqty'];
    subjectId = json['subjectId'];
    pricetotal = json['pricetotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartid'] = cartid;
    data['subjectName'] = subjectName;
    data['subjectQty'] = subjectQty;
    data['price'] = price;
    data['cartqty'] = cartqty;
    data['subjectId'] = subjectId;
    data['pricetotal'] = pricetotal;
    return data;
  }
}