class CategoryItem {
  final int? id;
  final String name;
  final String imagePath;

  CategoryItem({this.id, required this.name, required this.imagePath});
}

var categoryItemsDemo = [
  CategoryItem(
    name: "RICE & WHEAT",
    imagePath: "assets/images/categories_images/fruit.png",
  ),
  CategoryItem(
    name: "POTTATOES",
    imagePath: "assets/images/categories_images/oil.png",
  ),
  CategoryItem(
    name: "ONIONS",
    imagePath: "assets/images/categories_images/meat.png",
  ),
  CategoryItem(
    name: "PULSES",
    imagePath: "assets/images/categories_images/bakery.png",
  ),
  CategoryItem(
    name: "TEA & COFFEE",
    imagePath: "assets/images/categories_images/dairy.png",
  ),
  CategoryItem(
    name: "RUBBER, COTTON & JUTE",
    imagePath: "assets/images/categories_images/dairy.png",
  ),
];
