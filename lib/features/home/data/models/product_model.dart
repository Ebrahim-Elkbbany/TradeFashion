class ProductModel {
  final String? categoryName;
  final List<ProductModelProduct>? products;

  ProductModel({
    this.categoryName,
    this.products,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    categoryName: json["categoryName"],
    products: json["products"] == null
        ? []
        : List<ProductModelProduct>.from(
        json["products"]!.map((x) => ProductModelProduct.fromJson(x))),
  );


}

class ProductModelProduct {
  final int? id;
  final String? name;
  final Price? price;
  final String? colour;
  final String? brandName;
  final String? imageUrl;
  final List<String>? additionalImageUrls;

  ProductModelProduct({
    this.id,
    this.name,
    this.price,
    this.colour,
    this.brandName,
    this.imageUrl,
    this.additionalImageUrls,
  });

  factory ProductModelProduct.fromJson(Map<String, dynamic> json) =>
      ProductModelProduct(
        id: json["id"],
        name: json["name"],
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        colour: json["colour"],
        brandName: json["brandName"],
        imageUrl: json["imageUrl"],
        additionalImageUrls: json["additionalImageUrls"] == null
            ? []
            : List<String>.from(json["additionalImageUrls"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price?.toJson(),
    "colour": colour,
    "brandName": brandName,
    "imageUrl": imageUrl,
    "additionalImageUrls": additionalImageUrls == null
        ? []
        : List<dynamic>.from(additionalImageUrls!.map((x) => x)),
  };
}

class Price {
  final Current? current;
  final Current? previous;

  Price({
    this.current,
    this.previous,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    current:
    json["current"] == null ? null : Current.fromJson(json["current"]),
    previous: json["previous"] == null
        ? null
        : Current.fromJson(json["previous"]),
  );

  Map<String, dynamic> toJson() => {
    "current": current?.toJson(),
    "previous": previous?.toJson(),
  };
}

class Current {
  final double? value;
  final String? text;

  Current({
    this.value,
    this.text,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    value: json["value"]?.toDouble(),
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}
