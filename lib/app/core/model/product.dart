


class ProductModel {
  String? name, image, description, color, size, price, categoryId;

  ProductModel({
    this.name,
    this.image,
    this.color,
    this.price,
    this.categoryId,
    this.description,
    this.size
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
    image = json['image'];
    color = json['color'];
    categoryId = json['categoryId'];
    description = json['description'];
    price = json['price'];
  }

  static Map<String, dynamic> toJson(ProductModel product) {
    return {
      'name': product.name,
      'price': product.price,
      'size': product.size,
      'image': product.image,
      'color': product.color,
      'category': product.categoryId,
      'description': product.description,
    };
  }

  Map<String, dynamic> get toJsonGetter => toJson(this);
}