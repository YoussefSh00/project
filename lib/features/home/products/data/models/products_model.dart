class ProductsModel {
  final String? id;
  final LanguagesNames? name;
  final num? price;
  final String? currency;
  final num? stock;
  final String? model;
  final MaterialModel? material;
  final List<String>? colors;
  final String size;
  final DimansionsModel? dimansions;
  final int? numberOfPieces;
  final String? coverPictureUrl;
  final bool? isWishListed;

  ProductsModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.currency,
      required this.stock,
      required this.model,
      required this.material,
      required this.colors,
      required this.size,
      required this.dimansions,
      required this.numberOfPieces,
      required this.coverPictureUrl,
      required this.isWishListed});

  factory ProductsModel.fromJson(json) {
    return ProductsModel(
        id: json['_id'],
        name: LanguagesNames.fromJson(json['title']),
        price: json['price'],
        currency: json['currency'],
        stock: json['stock'],
        model: json['model'],
        material: MaterialModel.fromJson(json['material']),
        colors: List<String>.from(json['color']),
        size: json['size'],
        dimansions: DimansionsModel.fromJson(json['dimensions']),
        numberOfPieces: json['numberOfPieces'],
        coverPictureUrl: json['coverPictureUrl'],
        isWishListed: json['isWishListed']);
  }
}

class LanguagesNames {
  final String? en;
  final String? ar;
  final String? de;
  final String? tr;

  LanguagesNames(
      {required this.en, required this.ar, required this.de, required this.tr});
  factory LanguagesNames.fromJson(json) {
    return LanguagesNames(
      en: json['en'],
      ar: json['ar'],
      de: json['de'],
      tr: json['tr'],
    );
  }
}

class MaterialModel {
  final String? en;
  final String? ar;
  final String? de;
  final String? tr;

  MaterialModel(
      {required this.en, required this.ar, required this.de, required this.tr});
  factory MaterialModel.fromJson(json) {
    return MaterialModel(
      en: json['en'],
      ar: json['ar'],
      de: json['de'],
      tr: json['tr'],
    );
  }
}

class DimansionsModel {
  final Dimansion? length;
  final Dimansion? width;
  final Dimansion? height;
  
  
  DimansionsModel({required this.length, required this.width, required this.height});

  factory DimansionsModel.fromJson(json) {
    return DimansionsModel(
      length: Dimansion.fromJson(json['length']),
      width: Dimansion.fromJson(json['width']),
      height: Dimansion.fromJson(json['height']),
    );
  }

}
class Dimansion{
  final int? value;
  final String? unit;
  Dimansion({required this.value,required this.unit});
  factory Dimansion.fromJson(json){
    return Dimansion(
      value: json['value'],
      unit: json['unit']
    );
  }
}
