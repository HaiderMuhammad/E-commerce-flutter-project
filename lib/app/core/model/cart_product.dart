

class CartModel {
  String? name, image, price;
  int? quantity;

  CartModel({
    this.name,
    this.image,
    this.price,
    this.quantity
  });

  CartModel.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
  }

  static Map<String, dynamic> _toJson(CartModel cart) {
    return {
      'name': cart.name,
      'image': cart.image,
      'price': cart.price,
      'quantity': cart.quantity
    };
  }

  Map<String, dynamic> get toJson => _toJson(this);
}