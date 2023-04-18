

class CartModel {
  String? id, name, image, price, productId;
  int? quantity;

  CartModel({
    this.name,
    this.image,
    this.price,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    productId = json['productId'];
  }

  static Map<String, dynamic> _toJson(CartModel cart) {
    return {
      'id': cart.id,
      'productId': cart.productId,
      'name': cart.name,
      'image': cart.image,
      'price': cart.price,
      'quantity': cart.quantity
    };
  }

  Map<String, dynamic> get toJson => _toJson(this);
}