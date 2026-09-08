class ProductModel {
  String? status;
  List<Data>? data;

  ProductModel({
    this.status,
    this.data,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? productName;
  int? productCode;
  String? img;
  int? qty;
  int? unitPrice;
  int? totalPrice;

  Data({
    this.id,
    this.productName,
    this.productCode,
    this.img,
    this.qty,
    this.unitPrice,
    this.totalPrice,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    productName = json["ProductName"];
    productCode = json["ProductCode"];
    img = json["Img"];
    qty = json["Qty"];
    unitPrice = json["UnitPrice"];
    totalPrice = json["TotalPrice"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["ProductName"] = productName;
    _data["ProductCode"] = productCode;
    _data["Img"] = img;
    _data["Qty"] = qty;
    _data["UnitPrice"] = unitPrice;
    _data["TotalPrice"] = totalPrice;
    return _data;
  }
}
