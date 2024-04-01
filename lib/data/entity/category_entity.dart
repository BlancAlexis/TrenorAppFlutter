import '../Model/category_model.dart';

class CategoryEntity {
  String searchTerm;
  String image;
  String name;

  CategoryEntity(
      {required this.name, required this.image, required this.searchTerm});

  factory CategoryEntity.fromJSON(Map<String, dynamic> jsonData) {
    String name = jsonData['name'];
    String image = jsonData['image'];
    String searchterm = jsonData['searchterm'];
    return CategoryEntity(name: name, image: image, searchTerm: searchterm);
  }

  CategoryModel toModel() {
    return CategoryModel(name: name, image: image, searchTerm: searchTerm);
  }
}
