class Product {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  double price;
  String name;
  String description;
  String photoUrl;
  String slug;
  int ordering;
  bool featured;
  int categoryId;

  Product(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.price,
      this.name,
      this.description,
      this.photoUrl,
      this.slug,
      this.ordering,
      this.featured,
      this.categoryId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    price = json['price'].toDouble();
    name = json['name'];
    description = json['description'];
    photoUrl = json['photo_url'];
    slug = json['slug'];
    ordering = json['ordering'];
    featured = json['featured'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    data['name'] = this.name;
    data['description'] = this.description;
    data['photo_url'] = this.photoUrl;
    data['slug'] = this.slug;
    data['ordering'] = this.ordering;
    data['featured'] = this.featured;
    data['category_id'] = this.categoryId;
    return data;
  }
}
