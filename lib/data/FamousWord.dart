class FamousWordModel{
  String famousWord;

  FamousWordModel({required this.famousWord})

  factory FamousWordModel.fromJSON(Map<String, dynamic> jsonData) {
    return FamousWordModel(Map<String, dynamic>.from(jsonData) as List<String>);
  }

  FamousWordModel toModel() {
    return FamousWordModel(name: name, gid: gid);
  }
}