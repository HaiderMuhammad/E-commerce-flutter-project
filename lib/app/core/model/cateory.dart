


class CategoryModel {
  String? name, image;

  CategoryModel({this.name, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  static Map<String, dynamic> toJson(CategoryModel category) {
    return {
      'name': category.name,
      'Image': category.image,
    };
  }

  Map<String, dynamic> get toJsonGetter {
    return toJson(this);
}
}