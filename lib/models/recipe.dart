class Recipe {
  final String images;
  Recipe({ required this.images});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      images: json['images'][0]['hostedLargeUrl'] as String,
    );}

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe { image: $images,}';
  }
}