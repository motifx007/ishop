class ProductListRespone {
  List<ProductCategory>? data;

  ProductListRespone({
    this.data,
  });

  ProductListRespone.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductCategory>[];
      json['data'].forEach((v) {
        data?.add(ProductCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCategory {
  String? name;
  List<Products>? products;

  ProductCategory({this.name, this.products});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (products != null) {
      data['products'] = products?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  String? name;
  double? price;
  String? mainImage;
  int? stockQuantity;
  double? taxPercentage;

  Products({
    this.price,
    this.stockQuantity,
    this.taxPercentage,
    this.name,
    this.mainImage,
    this.id,
  });

  Products.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    stockQuantity = json['stockQuantity'];
    taxPercentage = json['taxPercentage'] ?? 0.0;
    name = json['name'];
    mainImage = json['mainImage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['stockQuantity'] = stockQuantity;
    data['taxPercentage'] = taxPercentage ?? 0.0;
    data['name'] = name;
    data['mainImage'] = mainImage;
    data['id'] = id;
    return data;
  }
}
