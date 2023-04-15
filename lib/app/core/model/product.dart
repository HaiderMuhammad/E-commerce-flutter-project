


class ProductModel {
  String? name, image, description, color, size, price, category;

  ProductModel({
    this.name,
    this.image,
    this.color,
    this.price,
    this.category,
    this.description,
    this.size
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
    image = json['image'];
    color = json['color'];
    category = json['category'];
    description = json['description'];
  }

  static Map<String, dynamic> toJson(ProductModel product) {
    return {
      'name': product.name,
      'size': product.size,
      'image': product.image,
      'color': product.color,
      'category': product.category,
      'description': product.description
    };
  }

  Map<String, dynamic> get toJsonGetter => toJson(this);
}