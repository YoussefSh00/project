class CategoriesModel {
  final String? id;
  final LanguagesNames? name;
  final String? image;

  CategoriesModel({required this.id, required this.name, required this.image});

  factory CategoriesModel.fromJson(json) {
    return CategoriesModel(
      id: json['_id'],
      name: LanguagesNames.fromJson(json['name']),
      image: json['image'],
    );
  }
}

class LanguagesNames {
  final String? en;
  final String? ar;
  final String? de;

  LanguagesNames({required this.en, required this.ar, required this.de});
  factory LanguagesNames.fromJson(json) {
    return LanguagesNames(
      en: json['en'],
      ar: json['ar'],
      de: json['de'],
    );
  }
}
