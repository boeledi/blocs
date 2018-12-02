import 'dart:ui';

class ShoppingItem extends Object {
  final int id;
  final String title;
  final double price;
  final Color color;

  const ShoppingItem({
    this.id,
    this.title,
    this.price,
    this.color,
  });

  @override
  bool operator==(Object other) => identical(this, other) || this.hashCode == other.hashCode;

  @override
  int get hashCode => id;
}