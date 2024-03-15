class FamousWordEntity{
  String famousWord;

  FamousWordEntity({required this.famousWord});

  factory FamousWordEntity.fromJSON(Map<String, dynamic> jsonData) {
    return FamousWordEntity(Map<String, dynamic>.from(jsonData) as List<String>);
  }

  FamousWordEntity toModel() {
    return FamousWordEntity(name: name, gid: gid);
  }
}