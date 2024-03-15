class CategoryModel {
  String searchterm;
  String image;
  String name;

CategoryModel({required this.name, required this.image, required this.searchterm});
}
class CategoryEntity {
  String searchterm;
  String image;
  String name;

  CategoryEntity({required this.name, required this.image, required this.searchterm});

  factory CategoryEntity.fromJSON(Map<String, dynamic> jsonData) {
    String name = jsonData['name'];
    String image = jsonData['image'];
    String searchterm = jsonData['searchterm'];
    return CategoryEntity(name: name, image: image, searchterm: searchterm);
  }

  CategoryModel toModel() {
    return CategoryModel(name: name,image: image, searchterm: searchterm);
  }
}